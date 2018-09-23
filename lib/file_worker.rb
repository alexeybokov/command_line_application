# frozen_string_literal: true

require 'fileutils'
require 'pry'

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
      prepare_result(data)
    rescue
      nil
    ensure
      open_file.close
    end
  end

  def parse_line(file_line)
    Hash[*file_line.match(REGEXP).captures]
  end
end

p FileWorker.read_file('score.txt')

