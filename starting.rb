require_relative './app'

def starting(action)
  app = App.new
  case action
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    app.create_a_person
  when 4
    app.create_a_book
  when 5
    app.create_a_rental
  when 6
    app.list_all_rentals
  end
end
