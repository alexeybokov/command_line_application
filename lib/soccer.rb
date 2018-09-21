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
end


teams_result.sort_by { |_key, value| value }.reverse.each do |k, v| puts "#{k} #{v} pts"
end
