require_relative './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name = 'Unknown', id = Random.rand(1..1000), permission: true)
    super(age, name, id, permission: permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
