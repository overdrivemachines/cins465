# functions to help with the implementation of the word ladder assignment

# if you place this file in wladder/lib you can use it in your controller
# by loading it:
#   load "#{Rails.root}/lib/ladder.rb"


# only load one dictionary
# load the dictionary of 4-letter words
load "#{Rails.root}/lib/words4.rb"

# load the dictionary of 5-letter words
#load "#{Rails.root}/lib/words5.rb"

# return true if the two strings differ by only one letter
def edit_distance_of_one word1, word2

	return false if word1.length != word2.length || word1.length == 0

	# count the different letters
	difference_count = 0
	word1.split(//).each_with_index do |ch, i|
		difference_count += 1 if word2[i] != ch
	end
	return difference_count == 1
end

# return true if the array steps contains a legal "ladder" progression from
# the first word to the last word
def legal steps

	# if any of the words are not in the dictionary
	steps.each do |word|
		return false if !dictionary.find_index word 
	end
	 
	# if consecutive words differ by more than one character
	for i in 0..steps.length-2 do
		return false if !edit_distance_of_one steps[i], steps[i+1]
	end

	# steps forms a legal word ladder
	return true

end

# return an array which is the legal "ladder" progression from the 
# first word to the last word
# References:
# 	-	http://www.cs.cmu.edu/~adamchik/15-121/labs/HW-4%20Word%20Ladder/lab.html
# 	-	http://web.stanford.edu/class/archive/cs/cs106b/cs106b.1134/handouts/15-Assignment2.pdf
# 	
def solution(first_word, last_word)
	my_dictionary = Array.new(dictionary)
	queue = Array.new
	# Remove the first word from the dictionary
	my_dictionary.delete(first_word)

	# Find all the words one letter different from the first word
	one_letter_diff_words = Array.new
	for i in 0..(first_word.size - 1)
		rx_string = String.new(first_word)
		rx_string[i] = "."
		puts "INFO: Matching " + rx_string
		rx = Regexp.new(rx_string)
		matching_words = Array.new(my_dictionary.select { |v| v =~ rx })
		puts "INFO: " + matching_words.inspect

		one_letter_diff_words = one_letter_diff_words + matching_words

		matching_words.each do |word|
			# stack = Array.new
			# stack.unshift(first_word)
			# stack.unshift(word)
		end
		puts "---------------"
	end

	one_letter_diff_words.uniq!
	puts "INFO: Size of array: " + one_letter_diff_words.size.to_s
	puts "INFO: " + one_letter_diff_words.inspect


end