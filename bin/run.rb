require 'require_all'
require_all 'lib'

calculator = PayslipProcessor.new
employees = calculator.process_csv
payslips = calculator.create_payslips(employees)

puts 'Name,Pay Period,Gross Income,Income Tax,Net Income,Super'

payslips.each do |payslip|
  puts "#{payslip.full_name},#{payslip.pay_period},"\
  "#{payslip.gross_income},#{payslip.income_tax},"\
  "#{payslip.net_income},#{payslip.super_amount}"
end

