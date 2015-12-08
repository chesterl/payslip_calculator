describe SuperAmount do

  let(:super_amount) { SuperAmount.calculate(gross_income, super_rate) }

  describe '.calculate' do
    context '10% super rate' do
      let(:super_rate) { 10 }

      context '5000 gross income' do
        let(:gross_income) { 5000 }

        it 'calculates super amount' do
          expect(super_amount).to eq(500)
        end
      end

      context '1000 gross income' do
        let(:gross_income) { 1000 }

        it 'calculates super amount' do
          expect(super_amount).to eq(100)
        end
      end
    end

    context '6666.66 gross income' do
      let(:gross_income) { 6666.66 }

      context '14% super rate' do
        let(:super_rate) { 14 }

        it 'calculates super amount' do
          expect(super_amount).to eq(933)
        end
      end

      context '34.7% super rate' do
        let(:super_rate) { 34.7 }

        it 'calculates super amount' do
          expect(super_amount).to eq(2313)
        end
      end
    end
  end

end
