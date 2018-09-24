require 'fileutils'

class UserInput
  def self.get_file_name
    puts "Enter your the filename(score.txt):"
    STDOUT.flush
    gets.chomp
  end

  def self.save_to_file(games_result)
    puts "Enter the filename for save result(result.txt):"
    STDOUT.flush
    File.open(gets.chomp, 'w+') do |f|
      games_result.each_with_index do |item, index|
      f.puts "#{(index+1).to_s+ '. ' +item[0].to_s+' . '+item[1].to_s + "#{ item[1] == 1 ? ' pt': ' pts'}"}"
      end
    end
  rescue
    return nil
  end
end
