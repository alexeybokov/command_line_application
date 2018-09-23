def save_to_file(file_name, games_result)
  begin
    File.open(file_name, 'w+') do |f|
      games_result.each_with_index do |item, index|
      f.puts (index+1).to_s+ '. ' +item[0].to_s+' . '+item[1].to_s + ' pts'
      end
    end
  rescue
    return nil
  end
end
