class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', permission: true)
    super(age, name, permission: permission)
    @classroom = classroom
  end

  def classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
