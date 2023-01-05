require_relative '../person'
require_relative '../decorator'

describe 'testing decorator classes' do
    it 'return the name of the person' do
      age = 20
      name = 'florin'
      person = Person.new(age, name)
      expect(person.correct_name).to eq(name)
    end

    it "return capitalized name" do
      age = 20
      name = 'florin'
      name2 = 'FLORIN'
      person = Person.new(age, name)
      capitalized_person = CapitalizeDecorator.new(person)
      expect(capitalized_person.correct_name).to eq name2
    end

    it "return name capitalized and trimed" do
        age = 20
        name = 'maximilianus'
        name2 = 'MAXIMILIAN'
      person = Person.new(age, name)
      capitalized_person = CapitalizeDecorator.new(person)
      trimmed_person = TrimmerDecorator.new(capitalized_person)
      expect(trimmed_person.correct_name).to eq name2
    end
end