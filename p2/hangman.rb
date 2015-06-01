#!/usr/bin/env ruby

# Assignment P2
# Cheating Hangman 
# Summer 2015
# 
# Dipen Chauhan
# 
require 'active_support/inflector'
$word_size = 5
$words = Array.new

def play
	letters_entered = Array.new
	chances = 10
	
	# Read the file and add only the words of the
	# specified size into the array
	f = File.open("words")
	f.each do |line|
		if (line.size == $word_size + 1)
			line.delete!("\n")
			$words << line
		end
	end

	while (chances > 0) do

		# Ask user to input their guess
		print "Enter your guess: "
		letter = gets.chomp
		rx = Regexp.new("^[a-z]$")	
		while ((rx =~ letter) != 0) do
			print "Enter your guess (a-z only): "
			letter = gets.chomp
		end

		# Check if letter was already inputted previously
		letter_repeated = true		
		while (letter_repeated) do
			if (letters_entered.index(letter) != nil)
				letter_repeated = true
				print "Enter your guess (do not enter previous guess): "
				letter = gets.chomp
			else
				letter_repeated = false
			end
		end

		letters_entered << letter

		# Check for hit or miss
		if (hit?(letter) == true)
			# print "Hit "
		else
			# print "Miss "
			chances -= 1
		end
		puts letters_entered.join(" ") + " (" + chances.to_s + " " + pluralize(chances, "chance") + " left)"
		if (draw(letters_entered))
			puts "YOU WON!"
			chances = 0
		else
			if (chances == 0)
				puts "YOU LOST! Word was: " + $words[0]
			end
		end
		# puts "[INFO]: # of words in Array = " + $words.size.to_s
		if ($words.size <= 10)
			# puts "[INFO]: $words = " + $words.join(", ")
		end
		# puts "------------------------------"
	end	
end

# Returns true when letter matches with one of the letters of 
# the selected word in the array
def hit?(letter)
	
	# Check number of occurences of the letter in the array
	matches = 0
	rx = Regexp.new(letter)
	matches = $words.count { |word| word =~ rx }

	# puts matches.to_s + " words contain the letter " + letter

	if (matches == 1)
		# Remove all words from the array that
		# do not match
		$words.keep_if { |word| word =~ rx }
		# puts "Found target word: " + $words.inspect
		return true
	elsif (matches == $words.size)
		rindex = rand($words.size)
		# puts "Random index = " + rindex.to_s
		word = $words[rindex]
		# puts "Selected word = " + word
		$words.clear
		$words << word
		# puts "$words = " + $words.to_s
		return true
	else
		# Remove all the words from the array
		# that contain the letter
		$words.delete_if {|word| word =~ rx}

		matches = 0
		rx = Regexp.new(letter)
		$words.each do |word|
			if (rx.match(word) != nil)
				# print word + " "
				matches += 1
			end
		end
		return false
	end
end


def draw(letters_entered)
	won = true
	if ($words.size > 1)
		won = false
		$word_size.times { print "_ " }
	else
		word = $words[0]
		for i in 0..(word.size - 1)
			c = word[i]
			if (letters_entered.count(c) >= 1)
				print c + " "
			else
				won = false
				print "_ "
			end
		end
	end
	print "\n"
	return won
end

def pluralize(number, text)
	return text.pluralize if number != 1
	text
end

puts "+-------------+"
puts "|   HANGMAN   |"
puts "+-------------+"
print "Enter word length between 5-20: "
$word_size = gets.chomp.to_i
if (($word_size < 5) || ($word_size > 20))
	$word_size = 5
end
puts "word size = " + $word_size.to_s
play