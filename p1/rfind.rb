#!/usr/bin/env ruby

# Assignment p1
# rfind (Ruby on Rails find utility) 
# Summer 2015
# 
# Dipen Chauhan

# search_files = File.join("**", "*.rb", "*.erb", "*.js", "*.css", "*.html", "*.yml", "*.txt")
files_list = Array.new

Dir.glob("*/*") do |f|
	files_list << f
end

puts files_list