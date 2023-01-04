require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require 'json'

class App
  def initialize
    @book = []
    @people = []
    @rental = []
    list_all_books_stored
    list_all_people_stored
    list_all_rentals_stored
  end

  def menu
    puts "1 - List all books\n2 - List all people\n3 - Create a person\n4 - Create a book
            \n5 - Create a rental\n6 - List all rental for a given id\n7 - Exit"
    input
  end

  def input
    action = gets.chomp.to_i
    if action < 7
      select(action)
    elsif action == 7
      puts 'Bye!'
    else
      puts 'Please select a number from 1 to 7'
      input
    end
  end

  def select(action)
    case action
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_all_rentals
    end
  end

  def list_all_books_stored
    if File.exist?('books.json') && !File.zero?('books.json')
      bookfile = File.open('books.json')
      bookjson = bookfile.read
      lista = JSON.parse(bookjson, object_class: OpenStruct).map do |bok|
        xmas = Book.new(bok.title, bok.author)
        @book.push(xmas)
      end
      bookfile.close
    else
      File.new('books.json', 'w')
    end
  end

  def list_all_books
    if @book.empty?
      (puts "\n\nThere are no books\n\n")
    else
      @book.each { |b| puts "\n\n#{b.title} written by #{b.author}\n\n" }
    end
    menu
  end

  def list_all_people_stored
    if File.exist?('people.json') && !File.zero?('people.json')
      pplfile = File.open('people.json')
      ppljson = pplfile.read
      lista = JSON.parse(ppljson, object_class: OpenStruct).map do |ppl|
        if ppl.classroom
          man = Student.new(ppl.classroom, ppl.age, ppl.name, permission: ppl.permission)
          @people.push(man)
        else
          man = Teacher.new(ppl.specialization, ppl.age, ppl.name, permission: true)
          @people.push(man)
        end
      end
      pplfile.close
    else
      File.new('people.json', 'w')
    end
  end

  def list_all_people
    if @people.empty?
      (puts "\n\nThere are no people\n\n")
    else
      @people.each { |p| puts "\n\nName:#{p.name}\nAge:#{p.age}\nClass:#{p.class}\nID:#{p.id}\n\n" }
    end
    menu
  end

  def create_a_person
    puts "\n\nCreate a Student (1) or create a Teacher (2)\n\n"
    x = gets.chomp.to_i
    case x
    when 1
      create_a_student
    when 2
      create_a_teacher
    else
      create_a_person
    end
  end

  def create_a_student
    puts 'classroom'
    cls = gets.chomp
    puts 'age'
    age = gets.chomp.to_i
    puts 'name'
    name = gets.chomp
    puts 'permission'
    perm = gets.chomp
    x = Student.new(cls, age, name, permission: perm)
    @people.push(x)
    person_to_string
  end

  def create_a_teacher
    puts 'specialization'
    spec = gets.chomp
    puts 'age'
    age = gets.chomp
    puts 'name'
    name = gets.chomp
    x = Teacher.new(spec, age, name)
    @people.push(x)
    person_to_string
  end

  def person_to_string
    jsonel = []
    @people.each do |item|
      if item.instance_of?(Student)
        jsonel.push({ classroom: item.classroom, age: item.age, name: item.name, permission: item.permission,
                      id: item.id })
      else
        jsonel.push({ age: item.age, name: item.name, permission: true, id: item.id })
      end
    end
    json = JSON.generate(jsonel)
    File.write('people.json', json)
    menu
  end

  def create_a_book
    puts 'title'
    titl = gets.chomp
    puts 'author'
    auth = gets.chomp
    x = Book.new(titl, auth)
    @book.push(x)
    jsonel = []
    @book.each { |item| jsonel.push({ title: item.title, author: item.author }) }
    json = JSON.generate(jsonel)
    File.write('books.json', json)
    menu
  end

  def create_a_rental
    puts 'date(yyyy/mm/dd)'
    date = gets.chomp
    puts 'select a book'
    @book.each_with_index { |b, i| puts "#{i}) #{b.title} written by #{b.author}" }
    bookind = gets.chomp.to_i
    book = @book[bookind]
    puts 'select a person'
    @people.each_with_index { |p, i| puts "#{i}) #{p.name}" }
    personind = gets.chomp.to_i
    person = @people[personind]
    rental = Rental.new(date, book, person)
    @rental.push(rental)

    p @rental

    jsonel = []
    @rental.each do |item|
      jsonel.push({
                    date: item.date,
                    book: { title: item.book.title,
                            author: item.book.author },
                    person: { id: item.person.id,
                              name: item.person.name,
                              age: item.person.age,
                              permission: item.person.permission }
                  })
    end
    json = JSON.generate(jsonel)
    File.write('rentals.json', json)

    menu
  end

  def list_all_rentals_stored
    if File.exist?('rentals.json') && !File.zero?('rentals.json')
      rentalfile = File.open('rentals.json')
      rentaljson = rentalfile.read
      lista = JSON.parse(rentaljson, object_class: OpenStruct).map do |rent|
        book = Book.new(rent.book.title, rent.book.author)
        person = Student.new('11a', rent.person.age, rent.person.name, rent.person.id, permission: true)
        item = Rental.new(rent.date, book, person)
        @rental.push(item)
      end
      rentalfile.close
    else
      File.new('rentals.json', 'w')
    end
  end

  def list_all_rentals
    if @rental.empty?
      puts("\n\nThere are no rentals\n\n")
    else
      puts 'please type person id'
      id = gets.chomp.to_i
      @rental.each do |r|
        puts "\n\nDate: #{r.date}, Book: \"#{r.book.title}\" by #{r.book.author} \n\n" if r.person.id == id
      end
    end
    menu
  end
end
