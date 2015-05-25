#!/usr/bin/env ruby

# Assignment P2
# Cheating Hangman 
# Summer 2015
# 
# Dipen Chauhan
# 

$word_size = 5
$words = Array.new

def play
	letters_right = Array.new
	letters_wrong = Array.new
	
	# Read the file and add only the words of the
	# specified size into the array
	f = File.open("words")
	f.each do |line|
		if (line.size == $word_size + 1)
			$words << line
		end
	end

	# Ask user to input guess
	print "Enter your guess: "
	letter = gets.chomp
	rx = Regexp.new("^[a-z]$")	
	while ((rx =~ letter) != 0) do
		print "Enter your guess (a-z only): "
		letter = gets.chomp
	end

	# Check for hit or miss
	if (hit?(letter) == true)
		puts "hit"
	else
		puts "miss"
	end
end

# Returns true when letter matches with one of the letters of 
# the selected word in the array
def hit?(letter)
	
	# Check number of occurences of the letter in the array
	matches = 0
	rx = Regexp.new(letter)
	$words.each do |word|
		if (rx.match(word) != nil)
			matches += 1
		end
	end

	if ((matches > 1) || (matches == 0))
		# Remove all the words from the array
		# that contain letter
		$words.each do |word|
			if (rx.match(word) != nil)
				$words.delete(word)
			end
		end
		return false
	else
		# Remove all words from the array that
		# do not match
		$words.each do |word|
			if (rx.match(word) == nil)
				$words.delete(word)
			end
		end
		return true
	end
end

def draw

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