#!/usr/bin/env ruby

require 'rubygems'
require 'fileutils'
require '../lib/index'
require 'commander/import'
require '../lib/file_parser'
require '../lib/file_saver'


program :name, 'command_line_app'
program :version, '0.0.1'
program :description, 'Task soccer_league'

command :run do |c|
  c.syntax = 'command_line_app read_from_file [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.option '--filename FILENAME', 'Filename with data'
  c.action do |args, options|
    options.filename ||= ask("Enter your the filename(score.txt):")
    say "Your result is prepare, if you want save result to file, run 'save_to_file'.
                        For show result run 'show_result'"
    parser = FileParser.new
    parser.read_file(options.filename)
    # Do something or c.when_called Command_line_app::Commands::Save_to_file
  end
end

command :save_to_file do |c|
  c.syntax = 'command_line_app save_to_file [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.option '--filename FILENAME', 'Filename for save result'
  c.action do |args, options|

    options.filename ||= ask("Enter the filename for save result(result.txt):")

    # Do something or c.when_called Command_line_app::Commands::Save_to_file
  end
end

command :show_result do |c|
  c.syntax = 'command_line_app show_result [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    options.filename ||= ask("Enter your the filename(score.txt):")
    say "Your result is prepare, if you want save result to file, run 'save_to_file'.
                        For show result run 'show_result'"
    result = FileParser.new
    result.read_file(options.filename)
    p result
    # sort_result = FileParser.sort_result(result)
    # p sort_result
    # Do something or c.when_called Command_line_app::Commands::Show_result
  end
end

