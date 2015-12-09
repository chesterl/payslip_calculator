describe Payslip do

 let(:employee) { Employee.new(attributes) }
 let(:attributes) {
   {
     first_name: 'Chester',
     last_name: 'Lam',
     salary: 65000,
     super_rate: 9,
     payment_start: '01 March-31 March'
   }
 }
  let(:employee_payslip) { Payslip.new(employee) }

  describe '#generate' do
    before :each do
      @gross_income = class_double('GrossIncome').as_stubbed_const
      @income_tax = class_double('IncomeTax').as_stubbed_const
      @income_dbl = instance_double('IncomeTax')
      @net_income = class_double('NetIncome').as_stubbed_const
      @super_amount = class_double('SuperAmount').as_stubbed_const
      allow(@gross_income).to receive(:calculate).with(employee.salary) { 5000 }
      allow(@income_tax).to receive(:new).with(employee.salary).and_return(@income_dbl)
      allow(@income_dbl).to receive(:calculate).and_return(4000)
      allow(@net_income).to receive(:calculate).with(5000, 4000).and_return(3000)
      allow(@super_amount).to receive(:calculate).with(5000, employee.super_rate).and_return(2000)
    end

    it 'calls all calculator methods' do
      aggregate_failures do
        expect(employee_payslip).to receive(:full_name)
        expect(@gross_income).to receive(:calculate).with(65000)
        expect(@income_dbl).to receive(:calculate).and_return(4000)
        expect(@net_income).to receive(:calculate).and_return(3000)
        expect(@super_amount).to receive(:calculate).and_return(2000)
      end

      employee_payslip.generate
    end

    it 'creates a payslip object with correct attributes' do
      employee_payslip.generate

      expect(employee_payslip).to have_attributes(
        full_name: 'Chester Lam',
        pay_period: '01 March-31 March',
        gross_income: 5000,
        income_tax: 4000,
        net_income: 3000,
        super_amount: 2000
      )
    end

  end

  describe '#full_name' do
    it 'creates full name attribute in payslip' do
      name = employee_payslip.full_name

      expect(name).to eq('Chester Lam')
    end
  end

end
