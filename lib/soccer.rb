require 'rubygems'
require 'bundler/setup'
require_relative 'file_worker'

class Soccer
  attr_reader :teams_result

  def initialize(data)
    @data = data
    @teams_result = {}
  end

  def prepare_result(data)
    teams_result = {}
    data.each do |item|
      unless teams_result.key?(item.keys[0])
        teams_result[item.keys[0]] = 0
      end
      unless teams_result.key?(item.keys[1])
        teams_result[item.keys[1]] = 0
      end
      if item.values[0] > item.values[1]
        teams_result[item.keys[0]] += 3
      elsif item.values[0] < item.values[1]
        teams_result[item.keys[1]] += 3
      elsif
        teams_result[item.keys[0]] += 1
        teams_result[item.keys[1]] += 1
      end
    end
  end


  def sort_result
    teams_result.sort_by { |_key, value| value }.reverse.each do |k, v|
      puts "#{k} #{v} pts"
    end
  end

  def prepare_result_2(data)
    data.inject(init_hash_with_zeros_as_values) { |result, row| process_single_row(row, result) }
  end

  def init_hash_with_zeros_as_values
    Hash.new { |hash, key| hash[key] = 0 }
  end

  def process_single_row(row, result)
    keys = row.keys
    values = row.values.map(&:to_i)
    if values.first > values.last
      result[keys.first] += 3
      result[keys.last] ||= 0
    elsif values.first < values.last
      result[keys.first] ||=0
      result[keys.last] += 3
    else
      result[keys.first] += 1
      result[keys.last] += 1
    end
    result
  end
end
