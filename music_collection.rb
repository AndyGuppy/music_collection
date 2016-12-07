require_relative('album_class')
require_relative('artist_class')
require_relative('display')
require ('pry')


option = ""

until option =="EXIT"
  new_screen()
  menu()
option = gets.chomp
  puts option

  case option

  when "1"
    new_screen()
    album_title = ask("Please enter Album Title")
    album_num_songs = ask("How many songs are on the Album ?").to_i
    album_year = ask("When was the Album released").to_i
    album_artist = ask("Enter the Artist")
    album_genre = ask("Enter the genre")
    #need to check if the artist exists
    result = Artist.find(album_artist)
    if result.empty?
      artist1 = Artist.new( {'name' => album_artist})
      artist1.save()
    else
    end
      album1 = Album.new({ 'title'=> album_title ,
        'num_songs'=> album_num_songs.to_i,
        'year'=> album_year.to_i,
        'genre'=> album_genre,
        'artist_id' => artist1.id })
      album1.save()

      when "2"
        albums =Array.new(Album.all)
        albums.each do
          |album|
          artist = Artist.find_by_id(album.artist_id)
          puts "'#{album.title}' -- #{artist} -- released in #{album.year} and contained #{album.num_songs} tracks"
        end
 
 when "3"
  album_artist = ask("Enter the Artist")
   albums =Album.find_by_artist(album_artist)
   albums.each do
     |album|
     artist = Artist.find_by_id(album.artist_id)
     puts "'#{album.title}' -- #{artist} -- released in #{album.year} and contained #{album.num_songs} tracks"
   end
  end

  loop


    binding.pry
    nil

end
