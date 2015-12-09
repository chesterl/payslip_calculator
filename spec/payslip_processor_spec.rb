describe PayslipProcessor do
  let(:payslip_processor) { PayslipProcessor.new }
  let(:employee_array) {
    [
      Employee.new(attributes),
      Employee.new(attributes),
      Employee.new(attributes),
    ]
  }
  let(:attributes) {
    {
      first_name: 'Chester',
      last_name: 'Lam',
      salary: 65000,
      super_rate: 9,
      pay_period: '01 March-31 March'
    }
  }

  describe '#process_csv' do
    context 'valid csv data' do
      it 'returns an array' do
        result = payslip_processor.process_csv

        expect(result).to be_an Array
      end

      it 'returns an array of employee objects' do
        result = payslip_processor.process_csv

        aggregate_failures do
          expect(result.first).to be_an Employee
          expect(result.last).to be_an Employee
        end
      end
    end

    context 'invalid csv data' do
      # Sample csv contains valid and invalid data
      it 'is not included in the array of employees' do
        result = payslip_processor.process_csv

        expect(result.count).to eq(3)
      end
    end
  end

  describe '#create_payslips' do
    it 'returns an array' do
      result = payslip_processor.create_payslips(employee_array)

      expect(result).to be_an Array
    end

    it 'returns an array of payslip objects' do
      result = payslip_processor.create_payslips(employee_array)

      aggregate_failures do
        expect(result.first).to be_a Payslip
        expect(result.last).to be_an Payslip
      end
    end
  end

  it 'returns payslip with correct calculations' do
    employee_array = payslip_processor.process_csv
    result = payslip_processor.create_payslips(employee_array)
    payslip = result.first

    aggregate_failures do
      expect(payslip.full_name).to eq('John Smith')
      expect(payslip.pay_period).to eq('01 March - 31 March')
      expect(payslip.gross_income).to eq(5004)
      expect(payslip.income_tax).to eq(922)
      expect(payslip.net_income).to eq(4082)
      expect(payslip.super_amount).to eq(450)
    end
  end
end
