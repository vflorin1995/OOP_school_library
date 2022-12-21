class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', permission: true)
    super(age, name, permission: permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
