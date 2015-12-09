class Employee

  attr_reader :first_name, :last_name, :salary, :super_rate, :pay_period

  def initialize(hash={})
    @first_name = hash[:first_name]
    @last_name = hash[:last_name]
    @salary = hash[:salary]
    @super_rate = hash[:super_rate]
    @pay_period = hash[:pay_period]
  end

end
