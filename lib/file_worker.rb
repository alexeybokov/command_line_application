# frozen_string_literal: true
require 'fileutils'

module FileWorker
  module_function

  REGEXP = /^(\w+|\w+\s\w+)\s{1,}(\d+),\s{1,}(\w+|\w+\s\w+)\s{1,}(\d+)$/i

  def read_file(file_name)
    data = []
    begin
      open_file = File.open(file_name, 'r')
      open_file.readlines.each do |line|
        if line_hash = parse_line(line)
          data << line_hash
        end
      end
      data
    rescue
      nil
    ensure
      open_file.close
    end
  end

  def parse_line(file_line)
    Hash[*file_line.match(REGEXP).captures]
  end

  def write_to_file(file_name, games_result)
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
end
