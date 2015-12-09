describe Income::GrossIncome do
  subject { Income::GrossIncome.calculate(salary) }

  describe '#calculate' do
    context '50,000 salary' do
      let(:salary) { 50000 }

      it 'returns gross income' do
        expect(subject).to eq(4167)
      end
    end

    context '60,000 salary' do
      let(:salary) { 60000 }

      it 'returns gross income' do
        expect(subject).to eq(5000)
      end
    end

    context '10,000 salary' do
      let(:salary) { 10000 }

      it 'returns gross income' do
        expect(subject).to eq(833)
      end
    end

    context '145099.99 salary' do
      let(:salary) { 145099.99 }

      it 'returns gross income' do
        expect(subject).to eq(12092)
      end
    end

    context '0 salary' do
      let(:salary) { 0 }

      it 'returns gross income' do
        expect(subject).to eq(0)
      end
    end
  end
end
