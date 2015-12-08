describe GrossIncome do

  describe '#calculate' do
    it 'calculates gross income for 50,000 salary' do
      result = GrossIncome.calculate(50000)

      expect(result).to eq(4167)
    end

    it 'calculates gross income for 60,000 salary' do
      result = GrossIncome.calculate(60000)

      expect(result).to eq(5000)
    end

    it 'calculates gross income for 10,000 salary' do
      result = GrossIncome.calculate(10000)

      expect(result).to eq(833)
    end

    it 'calculates gross income for 145099.54 salary' do
      result = GrossIncome.calculate(145999.99)

      expect(result).to eq(12167)
    end

    it 'calculates gross income for 0 salary' do
      result = GrossIncome.calculate(0)

      expect(result).to eq(0)
    end

  end
end
