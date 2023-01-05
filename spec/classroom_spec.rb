require_relative '../classroom.rb'
require_relative '../student.rb'

describe "test classroom class" do
    it "test initialize method" do
        label = '11A'
        classroom = Classroom.new(label)
        expect(classroom.label).to eq(label)
    end

    it "test add students method" do
        label = '11A'
        classroom = Classroom.new(label)
        classa = '12A'
        age = '21'
        student = Student.new(classa, age)
        classroom.add_students(student)
        expect(classroom.students[0].age).to eq(age)
        expect(classroom.students[0].classroom.label).to eq(label)
    end
end