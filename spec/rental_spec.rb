require_relative '../rental'
require_relative '../book'
require_relative '../teacher'

describe 'testing the rental class' do
  it 'testing the initialize method' do
    specialization = 'bio'
    age = 16
    teacher = Teacher.new(specialization, age)

    test_title = 'Scufita Rosie'
    test_author = 'Ion Creanga'
    book = Book.new(test_title, test_author)

    date = '2022'

    rental = Rental.new(date, book, teacher)

    expect(rental.date).to eq(date)
    expect(rental.book.title).to eq(test_title)
    expect(rental.book.author).to eq(test_author)
    expect(rental.person.age).to eq(16)
  end
end
