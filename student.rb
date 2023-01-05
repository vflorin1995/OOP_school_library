require_relative './person'

class Student < Person
  attr_reader :classroom, :permission, :age

  def initialize(classroom, age, name = 'Unknown', id = Random.rand(1..1000), permission: true)
    super(age, name, id, permission: permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
