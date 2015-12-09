module Tax
  class SuperAmount

    def self.calculate(gross_income, super_rate)
      (gross_income * (super_rate / 100.0)).round
    end

  end
end
