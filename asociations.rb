class Classroom
    attr_accessor :label

    def initialize(label)
        @label = label
        @students = []
    end

    def add_students(student)
        @students.push(student)
        student.classroom = self
    end
end

class Book
    attr_accessor :title
    attr_accessor :author

    def initialize(title, author)
        @title = title
        @author = author
        @rental = []
    end

    def add_rental(person, date)
        Rental.new(date, self, person)
    end
end


class Rental
    attr_accessor :date
    attr_reader :book
    attr_reader :person
    
    def initialize(date, book, person)
        @date = date

        @book = book
        book.rental.push(self)
        
        @person = person
        person.rental.push(self)
    end
end
