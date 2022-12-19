class Person
  def initialize(age, name = 'Unknown', permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  def is_of_age?
    @age >= 18
  end
end
