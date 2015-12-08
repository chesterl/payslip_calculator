describe NetIncome do

  let(:net_income) { NetIncome.calculate(gross_income, income_tax) }

  describe '.calculate' do
    let(:income_tax) { 15000 }

    context '50,000 gross salary' do
      let(:gross_income) { 50000 }

      it 'calculates net income' do
        expect(net_income).to eq(35000)
      end
    end

    context '65,000.42 gross salary' do
      let(:gross_income) { 65000.42 }

      it 'calculates net income' do
        expect(net_income).to eq(50000)
      end
    end
  end

end
