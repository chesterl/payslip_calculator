class Payslip

  attr_reader :employee
  attr_accessor :full_name, :pay_period, :gross_income, :income_tax, :net_income, :super_amount

  def initialize(employee)
    @employee = employee
  end

  def generate
    @full_name = full_name
    @pay_period = payment_start
    @gross_income = GrossIncome.calculate(employee_salary)
    @income_tax = IncomeTax.new(employee_salary).calculate
    @net_income = NetIncome.calculate(gross_income, income_tax)
    @super_amount = SuperAmount.calculate(gross_income, super_rate)
  end

  def full_name
    "#{employee.first_name} #{employee.last_name}"
  end

  private

  def payment_start
    employee.payment_start
  end

  def super_rate
    employee.super_rate
  end

  def employee_salary
    employee.salary
  end

end
