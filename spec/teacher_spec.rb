require_relative '../teacher.rb'

describe 'test teacher class' do
    it 'test initialize method' do 
        specialization = 'bio'
        age = 16
        teacher = Teacher.new(specialization, age)

        expect(teacher.specialization).to eq(specialization)
        expect(teacher.age).to eq(age)
    end

    it 'test can use services method' do
        specialization = 'bio'
        age = 16
        teacher = Teacher.new(specialization, age)
        
        expect(teacher.can_use_services?).to eq(true)
    end
end