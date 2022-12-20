class Nameble
  def correct_name
    NotImplementedError
  end
end

class Decorator < Nameble
  def initialize(nameble)
    super()
    @nameble = nameble
  end

  def correct_name
    @nameble.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameble.correct_name.upcase
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    if @nameble.correct_name.length > 10
      @nameble.correct_name[0, 10]
    else
      @nameble.correct_name
    end
  end
end

class Person < Nameble
  def initialize(age, name = 'Unknown', permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
