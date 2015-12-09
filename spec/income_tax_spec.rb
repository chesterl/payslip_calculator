describe IncomeTax do
  describe '#calculate' do
    it 'calls methods to calculate income tax' do
      income_tax = IncomeTax.new(50000)

      aggregate_failures do
        expect(income_tax).to receive(:monthly_income_tax)
        expect(income_tax).to receive(:taxable_income)
      end

      income_tax.calculate
    end
  end

  describe '#taxable_income' do
    before :each do
      @taxable_income = IncomeTax.new(salary).taxable_income
    end

    context '10,000 salary' do
      let(:salary) { 10000 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(0)
      end
    end

    context '15,000 salary' do
      let(:salary) { 15000 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(0)
      end
    end

    context '18,200 salary' do
      let(:salary) { 18200 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(0)
      end
    end

    context '18,201 salary' do
      let(:salary) { 18201 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(0.19)
      end
    end

    context '22,000 salary' do
      let(:salary) { 22000 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(722)
      end
    end

    context '37,000 salary' do
      let(:salary) { 37000 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(3572)
      end
    end

    context '37,001 salary' do
      let(:salary) { 37001 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(3572.325)
      end
    end

    context '45,000 salary' do
      let(:salary) { 45000 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(6172)
      end
    end

    context '60,000.50 salary' do
      let(:salary) { 60000.50 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(11047.1625)
      end
    end

    context '80,000 salary' do
      let(:salary) { 80000 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(17547)
      end
    end

    context '150,000 salary' do
      let(:salary) { 155666 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(45543.42)
      end
    end

    context '180,000 salary' do
      let(:salary) { 180000 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(54547)
      end
    end

    context '180,001 salary' do
      let(:salary) { 180001 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(54547.45)
      end
    end

    context '250,000 salary' do
      let(:salary) { 250000 }

      it 'returns income tax' do
        expect(@taxable_income).to eq(86047)
      end
    end
  end

  describe '#monthly_income_tax' do
    it 'calculates monthly tax on 50000' do
      income_tax = IncomeTax.new(70000)
      result = income_tax.monthly_income_tax(50000)

      expect(result).to eq(4167)
    end

    it 'calculates monthly tax on 100,000.44' do
      income_tax = IncomeTax.new(150000)
      result = income_tax.monthly_income_tax(100000.44)

      expect(result).to eq(8333)
    end
  end
end

