class Student < Person
  def initialize(classroom, age, name = 'Unknown', permission: true)
    super(age, name, permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
