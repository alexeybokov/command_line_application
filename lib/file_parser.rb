# frozen_string_literal: true

require 'fileutils'

class FileParser

  REGEXP = /^(\w+|\w+\s\w+)\s{1,}(\d+),\s{1,}(\w+|\w+\s\w+)\s{1,}(\d+)$/i

  def self.read_file(file_name)
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

  private

  def self.parse_line(file_line)
    Hash[*file_line.match(REGEXP).captures]
  end

  def self.prepare_result(data)
    data.inject(init_hash_with_zeros_as_values) { |result, row| process_single_row(row, result) }
  end

  def self.init_hash_with_zeros_as_values
    Hash.new { |hash, key| hash[key] = 0 }
  end

  def self.process_single_row(row, result)
    keys = row.keys
    values = row.values.map(&:to_i)
    if values.first > values.last
      result[keys.first] += 3
      result[keys.last] ||= 0
    elsif values.first < values.last
      result[keys.first] ||= 0
      result[keys.last] += 3
    else
      result[keys.first] += 1
      result[keys.last] += 1
    end
    result
  end

  def self.sort_result(result)
    result.sort_by do |name, _score|
      name
    end.to_h.group_by do |_name, score|
      score
    end.sort_by do |g_score, _items|
      -g_score
    end.to_h.values.flat_map do |a|
      a
    end.to_h
  end
end
