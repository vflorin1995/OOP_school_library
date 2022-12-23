#!/usr/bin/env ruby
require_relative './app'

def main
  puts "Welcome to School Library App!\nPlease choose an option by enterin a number from 1 to 7:
  \n1 - List all books\n2 - List all people\n3 - Create a person\n4 - Create a book
  \n5 - Create a rental\n6 - List all rental for a given id\n7 - Exit"
  action = gets.chomp.to_i
  if action < 7 && action.positive?
    starting(action)
  elsif action == 7
    puts 'Bye!'
  else
    main
  end
end

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

main
