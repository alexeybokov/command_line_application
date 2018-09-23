class UserInput

  def get_file_name()
    puts "Enter your the filename(soccer.txt):"
    STDOUT.flush
    gets.chomp
  end

  def save_result(games_result)
    puts "Enter the filename for save result(result.txt):"
    STDOUT.flush
    gets.chomp
  end
end
