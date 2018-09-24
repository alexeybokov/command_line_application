require 'fileutils'

class FileSaver
  def self.save(games_result)
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
