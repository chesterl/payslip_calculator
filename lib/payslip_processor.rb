require 'csv'

class PayslipProcessor

  def process_csv
    employee_array = []

    Dir.glob("csv/*.csv") do |file|
      basename = File.basename(file, '.csv')

      CSV.foreach(file, converters: :numeric, headers:true) do |row|
        employee_info = {
          first_name: row['first_name'],
          last_name: row['last_name'],
          salary: row['annual_salary'],
          super_rate: row['super_rate'],
          pay_period: row['pay_period']
        }

        if Validator.valid?(employee_info)
          employee_array << Employee.new(employee_info)
        end
      end
    end

    employee_array
  end

  def create_payslips(employee_array)
    employee_array.map do |employee|
      payslip = Payslip.new(employee)
      payslip.generate
      payslip
    end
  end

end
