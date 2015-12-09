class IncomeTax

  TAX_BRACKET_1 = 18200
  TAX_BRACKET_2 = 37000
  TAX_BRACKET_3 = 80000
  TAX_BRACKET_4 = 180000

  TAX_RATE_1 = 0.19
  TAX_RATE_2 = 0.325
  TAX_RATE_3 = 0.37
  TAX_RATE_4 = 0.45

  attr_reader :salary

  def initialize(salary)
    @salary = salary
  end

  def calculate
    monthly_income_tax(taxable_income)
  end

  def taxable_income
    if salary <= TAX_BRACKET_1
      0
    elsif salary.between?(TAX_BRACKET_1, TAX_BRACKET_2)
      (salary - TAX_BRACKET_1) * TAX_RATE_1
    elsif salary.between?(TAX_BRACKET_2, TAX_BRACKET_3)
      3572 + (salary - TAX_BRACKET_2) * TAX_RATE_2
    elsif salary.between?(TAX_BRACKET_3, TAX_BRACKET_4)
      17547 + (salary - TAX_BRACKET_3) * TAX_RATE_3
    else
      54547 + (salary - TAX_BRACKET_4) * TAX_RATE_4
    end
  end

  def monthly_income_tax(taxable_income)
    (taxable_income / 12.0).round
  end

end
