require_relative '../book'
require_relative '../student'

describe 'Test the book class' do
  it 'Test the initialize method' do
    test_title = 'Scufita Rosie'
    test_author = 'Ion Creanga'
    book = Book.new(test_title, test_author)

    expect(book.title).to eq(test_title)
    expect(book.author).to eq(test_author)
  end

  it 'Test the add rental method' do
    test_title = 'Scufita Rosie'
    test_author = 'Ion Creanga'
    classroom = '11A'
    age = 16
    date = '2022'
    student = Student.new(classroom, age)
    book = Book.new(test_title, test_author)
    book.add_rental(student, date)

    expect(book.rental[0].date).to eq(date)
    expect(book.rental[0].person.age).to eq(age)
    expect(book.rental[0].person.classroom).to eq(classroom)
  end
end
