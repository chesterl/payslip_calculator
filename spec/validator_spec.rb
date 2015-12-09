describe Validator do
  let(:employee_info) {
    {
      first_name: first_name,
      last_name: last_name,
      salary: salary,
      super_rate: super_rate,
      pay_period: pay_period
    }
  }
  let(:first_name) { 'Chester' }
  let(:last_name) { 'Lam' }
  let(:salary) { 65000 }
  let(:super_rate) { 9 }
  let(:pay_period) { '01 March-31 March' }

  subject { Validator.valid?(employee_info) }

  describe '#valid?' do
    context 'valid employee info' do
      it 'returns true' do
        expect(subject).to be true
      end
    end

    context 'invalid employee info' do
      context 'negative salary' do
        let(:salary) { -5000 }

        it 'returns false' do
          expect(subject).to be false
        end
      end

      context 'non integar salary' do
        let(:salary) { 'Fake salary' }

        it 'returns false' do
          expect(subject).to be false
        end
      end

      context 'negative super rate' do
        let(:super_rate) { -4 }

        it 'returns false' do
          expect(subject).to be false
        end
      end

      context 'greater than 50 super rate' do
        let(:super_rate) { 51 }

        it 'returns false' do
          expect(subject).to be false
        end
      end

      context 'non integar super rate' do
        let(:super_rate) { 'Fake super' }

        it 'returns false' do
          expect(subject).to be false
        end
      end
    end
  end
end
