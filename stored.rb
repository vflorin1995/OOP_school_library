def list_all_books_stored
  if File.exist?('books.json') && !File.zero?('books.json')
    bookfile = File.open('books.json')
    bookjson = bookfile.read
    JSON.parse(bookjson).map do |bok|
      xmas = Book.new(bok['title'], bok['author'])
      @book.push(xmas)
    end
    bookfile.close
  else
    File.new('books.json', 'w')
  end
end

def list_all_people_stored
  if File.exist?('people.json') && !File.zero?('people.json')
    pplfile = File.open('people.json')
    ppljson = pplfile.read
    JSON.parse(ppljson).map do |ppl|
      if ppl['classroom']
        @people.push(Student.new(ppl['classroom'], ppl['age'], ppl['name'], permission: ppl['permission']))
      else
        @people.push(Teacher.new(ppl['specialization'], ppl['age'], ppl['name'], permission: true))
      end
    end
    pplfile.close
  else
    File.new('people.json', 'w')
  end
end

def list_all_rentals_stored
  if File.exist?('rentals.json') && !File.zero?('rentals.json')
    rentalfile = File.open('rentals.json')
    rentaljson = rentalfile.read
    JSON.parse(rentaljson).map do |rent|
      book = Book.new(rent['book']['title'], rent['book']['author'])
      person = Student.new('11a', rent['person']['age'], rent['person']['name'], rent['person']['id'])
      item = Rental.new(rent['date'], book, person)
      @rental.push(item)
    end
    rentalfile.close
  else
    File.new('rentals.json', 'w')
  end
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
