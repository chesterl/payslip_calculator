class Validator

  def self.valid?(employee_info={})
    valid_salary(employee_info[:salary]) &&
    valid_super_rate(employee_info[:super_rate])
  end

  def self.valid_salary(salary)
    (salary.is_a?(Integer) || salary.is_a?(Float)) &&
      salary >= 0
  end

  def self.valid_super_rate(super_rate)
    (super_rate.is_a?(Integer) || super_rate.is_a?(Float)) &&
      (0..50).include?(super_rate)
  end

end







