module Income
  class NetIncome

    def self.calculate(gross_income, income_tax)
      (gross_income - income_tax).round
    end

  end
end
