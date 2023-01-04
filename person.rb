require_relative './nameble'

class Person < Nameble
  attr_reader :id, :rental, :name, :age

  def initialize(age, name = 'Unknown', id = Random.rand(1..1000), permission: true)
    super()
    @name = name
    @age = age
    @permission = permission
    @id = id
    @rental = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
