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
			line.delete!("\n")
			$words << line
		end
	end

	while (true) do

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
			if ((letters_right.index(letter) != nil) || (letters_wrong.index(letter) != nil))
				letter_repeated = true
				print "Enter your guess (do not enter previous guess): "
				letter = gets.chomp
			else
				letter_repeated = false
			end
		end

		# Check for hit or miss
		if (hit?(letter) == true)
			letters_right << letter
			puts "Hit"
		else
			letters_wrong << letter
			puts "Miss"
		end
		puts "Letters Right: " + letters_right.join("-")
		puts "Letters Wrong: " + letters_wrong.join("-")
		puts "# of words in Array = " + $words.size.to_s
		if ($words.size <= 10)
			puts $words.inspect
		end
		puts "---------------"
	end

	
end

# Returns true when letter matches with one of the letters of 
# the selected word in the array
def hit?(letter)
	
	# Check number of occurences of the letter in the array
	matches = 0
	rx = Regexp.new(letter)
	matches = $words.count { |word| word =~ rx }

	puts matches.to_s + " words contain the letter " + letter

	if (matches == 1)
		# Remove all words from the array that
		# do not match
		$words.keep_if { |word| word =~ rx }
		# $words.each do |word|
		# 	if (rx.match(word) == nil)
		# 		$words.delete(word)
		# 	end
		# end
		puts "Found target word: " + $words.inspect
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