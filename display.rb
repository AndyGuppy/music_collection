def new_screen()
  system "clear"
puts "          Code Clans Music Collection          "
puts "          ===========================          "
puts "                                               "

end

def menu()

puts "       --------------------------------- "
puts "       |  1 - ENTER NEW ALBUM          | "
puts "       |  2 - LIST ALL ALBUMS          | "
puts "       |  3 - SEARCH BY ARTIST         | "
puts "       |  4 - SEARCH FOR ALBUM         | "
puts "       |  5 - DELETE AN ALBUM          | "
puts "       |  6 - DELETE ALBUMS BY ARTIST  | "
puts "       |                               | "
puts "       |  ENTER EXIT to QUIT           | "
puts "       --------------------------------- "
puts "                                "
puts "PLEASE ENTER AN OPTION 1 - 6 :- "

end

def ask(string)
puts string
return gets.chomp
end