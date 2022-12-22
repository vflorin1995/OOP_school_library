class Person < Nameble
  attr_reader :id, :rentals, :name, :age

  def initialize(age, name = 'Unknown', permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = permission
    @rental = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rental.push(rental)
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end
