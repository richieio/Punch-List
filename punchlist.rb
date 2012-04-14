class Punchy
	# Punchy runs the command line stuff, triggers projects and tasks classes
	#   Project		Gungho-Guides folder containing 
	#     |_Feature		features.md headings are features, paragraphs under are descriptions of tasks
	#     | |_Tasks		Ordered list of tasks pertaining to each feature
	#     |
	#     |_Bugs		bugs.md headings are bugs, paragraphs under are descriptions of tasks
	#       |_tasks		Ordered list of tasks pertaining to each bug

	# Creates basic method and instance vars
	def initialize
	
	end

	def home_screen

	end
end

ARGV.each do |a|
	puts "Argument: #{a}"
end
