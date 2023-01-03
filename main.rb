require_relative './starting'

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

main
