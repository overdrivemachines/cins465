#!/usr/bin/env ruby

# Assignment p1
# rfind (Ruby on Rails find utility) 
# Summer 2015
# 
# Dipen Chauhan

file_extensions = ["*.rb", "*.erb", "*.js", "*.css", "*.html", "*.yml", "*.txt"]
files_list = Array.new

file_extensions.each do |ext|
	extfiles = File.join("**", ext)
	Dir.glob(extfiles) do |f|
		files_list << f
	end
end

# Sort the list
files_list.sort!

# Construct a new regular expression
arg = ARGV[0]
if (arg == nil)
	arg = ""
end
rx = Regexp.new(arg)

puts "Files with names that matches <" + arg + ">"
puts "**************************************************"
files_list.each do |f|
	if (rx.match(f))
		puts f
	end
end