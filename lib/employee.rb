class Employee

  def initialize(hash={})
    @first_name = hash[:first_name]
    @last_name = hash[:last_name]
    @salary = hash[:salary]
    @super_rate = hash[:super_rate]
    @payment_start = hash[:payment_start]
  end

end