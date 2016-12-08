require_relative('album_class')
require_relative('artist_class')
require_relative('display')
require ('pry')


option = ""

until option =="EXIT"
  new_screen()
  menu()
  option = gets.chomp

  case option

  when "1"
    new_screen()
    album_title = ask("Please enter Album Title")
    album_num_songs = ask("How many songs are on the Album ?").to_i
    album_year = ask("When was the Album released").to_i
    album_artist = ask("Enter the Artist")
    album_genre = ask("Enter the genre")
    #need to check if the artist exists
    result = Artist.find_id(album_artist)
    if result.empty? == true
      artist1 = Artist.new( {'name' => album_artist})
      artist1.save()
    else
    end
    album1 = Album.new({ 'title'=> album_title ,
      'num_songs'=> album_num_songs.to_i,
      'year'=> album_year.to_i,
      'genre'=> album_genre,
      'artist_id' => result})
    album1.save()
    puts
    puts "Press Enter to continue"
    gets.chomp

  when "2"
    albums =Array.new(Album.all)
    albums.each do
      |album|
      artist = Artist.find_by_id(album.artist_id)
      puts "'#{album.title}' -- #{artist} -- released in #{album.year} and contained #{album.num_songs} tracks"
    end
    puts
    puts "Press Enter to continue"
    gets.chomp
    
    
  when "3"
    album_artist = ask("Enter the Artist")
    albums =Array.new(Album.find_by_artist(album_artist))
    albums.each do
     |album|
     artist = Artist.find_by_id(album.artist_id)
     puts "'#{album.title}' -- #{artist} -- released in #{album.year} and contained #{album.num_songs} tracks"
   end
   puts
   puts "Press Enter to continue"
   gets.chomp

 when "4"
  album_title = ask("Please enter Album Title")
  albums =Array.new(Album.find(album_title))
  if albums.empty? == true
    puts
    puts  "Album does not exist"
  else
   albums.each do
     |album|
     artist = Artist.find_by_id(album.artist_id)
     puts "'#{album.title}' -- #{artist} -- released in #{album.year} and contained #{album.num_songs} tracks -- Genre = #{album.genre}"
   end
 end
 puts
 puts "Press Enter to continue"
 gets.chomp

when "5"
  album_title = ask("Enter the title of album")
  Album.delete(album_title)
  albums =Array.new(Album.find(album_title))
  if albums.empty? == true
    puts
    puts  "Album has been deleted"
  else
   puts
   puts  "Album FAILED to delete, Please contact Administrator"
 end
 puts
 puts "Press Enter to continue"
 gets.chomp

when "6"
  album_artist = ask("Enter name of artist")
  Album.delete_by_artist(album_artist)
  albums =Array.new(Album.find_by_artist(album_artist))
  if albums.empty? == true
    puts
    puts  "All albums by '#{album_artist}' have been deleted"
  else
   puts
   puts  "Albums FAILED to delete, Please contact Administrator"
 end
 puts
 puts "Press Enter to continue"
 gets.chomp
 
when "7"
 album_title = ask("Enter name of album to be updated")
 albums =Array.new(Album.find(album_title.to_s))
 if albums.empty? == true
  puts
  puts  "Album does not exist"
 else
   albums.each do
   |album|
   artist = Artist.find_by_id(album.artist_id)
   puts "#{album.id} --> '#{album.title}' -- #{artist} -- released in #{album.year} and contained #{album.num_songs} tracks -- Genre = #{album.genre}"
   puts 
   puts "Is this the correct album ?  ( Y /N )"
   response = gets.chomp
   if response =="Y" || "y"
    puts "What would you like to change (artist / title / songs / year / genre"
    response = gets.chomp
    case response
    when "artist"


    when "title"
      puts "Please enter new title"
       album.title = gets.chomp


    when "songs"
      album.num_songs = gets.chomp.to_i

    when "year"
      album.year = gets.chomp.to_i

    when "genre"
      album.genre = gets.chomp
    else

    end
    # Album.update(album.id,album.title,album.num_songs, album.year, album.artist_id, album.genre)
    album.update()
    else

    end
  

end
end

end

loop
end
