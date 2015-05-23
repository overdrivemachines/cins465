#!/usr/bin/env ruby

# Assignment p1
# rfind (Ruby on Rails find utility) 
# Summer 2015
# 
# Dipen Chauhan
# 
# Useful Links:
# 	1) Ruby find string in file and print result
# 		http://stackoverflow.com/questions/10832440/ruby-find-string-in-file-and-print-result
# 	2) How to open a file and search for a word?
# 		http://stackoverflow.com/questions/1896555/how-to-open-a-file-and-search-for-a-word
# 	3) Finding lines in a text file matching a regular expression
# 		http://stackoverflow.com/questions/6002868/finding-lines-in-a-text-file-matching-a-regular-expression
# 	

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
files_list.each do |f|
	if (rx.match(f))
		puts "  ./" + f
	end
end
puts "**************************************************"

# Find string in the file
# http://stackoverflow.com/questions/10832440/ruby-find-string-in-file-and-print-result
puts "Files with content that matches <" + arg + ">"
printing_first_file_results = true
files_list.each do |filename|
	line_number = 1
	printed_file_name = false
	File.open(filename) do |f|
		f.each_line do |line|
			if line =~ rx
				if printed_file_name == false
					if printing_first_file_results == false
						puts "--------------------------------------------------"
					else
						printing_first_file_results = false
					end					
					puts "./" + filename
					printed_file_name = true
				end
				puts "  " + line_number.to_s + ":" + line
			end
			line_number += 1
		end
	end
end