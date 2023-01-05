require_relative '../person.rb'
require_relative '../book.rb'

describe "Test the person class" do
    it "Test the initialize method" do
        age = 16
        person = Person.new(age)

        expect(person.age).to eq(age)
        expect(person.name).to eq('Unknown')
        expect(person.permission).to eq(true)
    end

    it "Test can use services method" do
        age1 = 16
        age2 = 24
        name = 'David'
        id = 100
        minor1 = Person.new(age1)
        minor2 = Person.new(age1, name, id, permission: false)
        major1 = Person.new(age2)
        major2 = Person.new(age2, name, id, permission: false)

        expect(minor1.can_use_services?).to eq(true)
        expect(minor2.can_use_services?).to eq(false)
        expect(major1.can_use_services?).to eq(true)
        expect(major2.can_use_services?).to eq(true)
    end

    it "Test the correct name method" do
        age = 23
        name = 'Mark'
        person = Person.new(age, name)
        expect(person.correct_name).to eq(name)
    end

    it "Test the add rental method" do
        title = 'Pinocchio'
        author = 'Pino'
        age = 22
        book = Book.new(title, author)
        date = '2022'
        person = Person.new(age)
        person.add_rental(book, date)

        expect(person.rental[0].date).to eq(date)
        expect(person.rental[0].book.title).to eq(title)
        expect(person.rental[0].book.author).to eq(author)
    end
end
