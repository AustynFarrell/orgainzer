require './lib/cd_organizer'

def main_menu
  puts "Press 'c' to enter a new CD"
  puts "Press 'l' to list out your CDs"
  puts "Press 's' to search for a CD by album or artist"
  puts "Press 'x' to exit the program"
  choice = gets.chomp
  case choice
    when 'c' then create_cd
    when 'l' then list_cds
    when 's' then search_cd
    when 'x' then puts "Goodbye"
    else
      puts "That is not a valid option"
      main_menu
  end
end

def create_cd
  puts "Enter your artist"
  artist = gets.chomp
  puts "Enter your album"
  album = gets.chomp
  new_cd = Cd.create({artist: artist, album: album})
  puts "#{new_cd.artist}: #{new_cd.album} entered!" "\n"
  main_menu
end

def list_cds
  Cd.all.each do |cd|
    puts cd.artist + ":" + cd.album
  end
  main_menu
end

def list_artist_cds
  Cd.all.each do |cd|
    puts cd.artist
  end
  main_menu
end

def search_cd
  puts "Enter album or artist that you want to search"
  search_item = gets.chomp
  output = Cd.search(search_item)
  puts output.artist + ":" + output.album
  main_menu
end
main_menu
