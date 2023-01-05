require_relative '../student.rb'
require_relative '../classroom.rb'

describe "testing student class" do
    it "testing initialize method" do
        classroom = '11A'
        age = '21'
        student = Student.new(classroom, age)

        expect(student.classroom).to eq(classroom)
        expect(student.age).to eq(age)
        expect(student.permission).to eq(true)
    end

    it "testing classroom" do
        classroom = '11A'
        age = '21'
        student = Student.new(classroom, age)
        label = '12A'
        classroom2 = Classroom.new(label)
        student.classroom = classroom2
        expect(student.classroom.label).to eq(label)
    end

    it "testing play hoockey" do
        response = '¯\(ツ)/¯'
        classroom = '11A'
        age = '21'
        student = Student.new(classroom, age)
        expect(student.play_hooky).to eq(response)
    end
end
