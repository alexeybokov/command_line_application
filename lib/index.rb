require 'rubygems'
require 'bundler/setup'
require 'commander'
require_relative 'file_parser'
require_relative 'user_input'
require_relative 'file_saver'


get_file = UserInput.get_file_name
result = FileParser.read_file(get_file)
sort_result = FileParser.sort_result(result)
save_to_file = FileSaver.save(sort_result)
p save_to_file

