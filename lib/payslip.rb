class Payslip

  attr_reader :employee
  attr_accessor :full_name, :pay_period, :gross_income, :income_tax, :net_income, :super_amount

  def initialize(employee)
    @employee = employee
  end

  def generate
    @full_name = full_name
    @pay_period = employee_pay_period
    @gross_income = Income::GrossIncome.calculate(employee_salary)
    @income_tax = Tax::IncomeTax.new(employee_salary).calculate
    @net_income = Income::NetIncome.calculate(gross_income, income_tax)
    @super_amount = Tax::SuperAmount.calculate(gross_income, employee_super_rate)
  end

  def full_name
    "#{employee.first_name} #{employee.last_name}"
  end

  private

  def employee_pay_period
    employee.pay_period
  end

  def employee_super_rate
    employee.super_rate
  end

  def employee_salary
    employee.salary
  end

end
