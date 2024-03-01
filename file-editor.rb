def create_file(filename)
  begin
    File.open(filename, 'w') do |file|
      puts "File #{filename} created."
    end
  rescue StandardError => e
    puts "Error creating file: #{e.message}"
  end
end

def open_file(filename)
  begin
    if File.exist?(filename)
      File.open(filename, 'r') do |file|
        puts "File contents #{filename}:"
        puts file.read
      end
    else
      puts "File #{filename} does not exist."
    end
  rescue StandardError => e
    puts "Error opening file: #{e.message}"
  end
end

def write_to_file(filename, content)
  begin
    File.open(filename, 'a') do |file|
      file.puts content
    end
    puts "Data written to file #{filename}."
  rescue StandardError => e
    puts "Error writing to file: #{e.message}"
  end
end

def main_menu
  puts "\nSimple text editor"
  puts "1. Create a new file"
  puts "2. Open an existing file"
  puts "3. Add text to file"
  puts "4. Exit"
end

loop do
  main_menu
  print "Choose an action: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter the name of the new file: "
    filename = gets.chomp
    create_file(filename)
  when 2
    print "Enter a file name to open: "
    filename = gets.chomp
    open_file(filename)
  when 3
    print "Enter a file name to add text: "
    filename = gets.chomp
    print "Enter text to add: "
    content = gets.chomp
    write_to_file(filename, content)
  when 4
    puts "Goodbye!"
    break
  else
    puts "Wrong choice. Try again."
  end
end
