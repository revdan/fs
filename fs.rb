#!/usr/bin/env ruby
require 'rubygems'
require 'commander/import'
require 'freesound'
require "awesome_print"
require 'open-uri'

Freesound.api_key = FREESOUND_API_KEY
client = Freesound::Client.new

# :name is optional, otherwise uses the basename of this executable
program :name, 'freesound command line tool'
program :version, '1.0.0'
program :description, 'whatever, chump.'

command :grep do |c|
  c.syntax = 'fs grep'
  c.description = 'searches freesound'
  c.action do |args, options|
    query = args.join('+')
    results = client.search(query)
    results.each do |s|
      puts "#{s.id} :: #{s.original_filename}"
    end
  end
end

command :info do |c|
  c.syntax = 'fs info'
  c.description = 'full info for single sample'
  c.action do |args, options|
    sound = client.sound(args.first)
    ap sound.attributes
  end
end

command :play do |c|
  c.syntax = 'fs play'
  c.description = 'plays the sample'
  c.action do |args, options|
    sound = client.sound(args.first)
    filename = "./temp.mp3"
    open(filename, 'wb') do |file|
      file << open(sound.preview_hq_mp3).read
    end

    system "afplay #{filename} -d"
    File.delete(filename)
  end
end

command :dl do |c|
  c.syntax = 'fs dl'
  c.description = 'downloads the sample'
  c.action do |args, options|
    dir = ask "sample folder name:"
    system "mkdir ./#{dir}" unless File.directory? dir
    sound = client.sound(args.first)
    filename = "./#{dir}/#{sound.original_filename}"
    open(filename, 'wb') do |file|
      file << open(sound.url).read
    end
    ap filename
  end
end
