class Punchy
	# Punchy runs the command line stuff, triggers projects and tasks classes
	#   Project		Gungho-Guides folder containing 
	#     |_Feature		features.md headings are features, paragraphs under are descriptions of tasks
	#     | |_Tasks		Ordered list of tasks pertaining to each feature
	#     |
	#     |_Bugs		bugs.md headings are bugs, paragraphs under are descriptions of tasks
	#       |_tasks		Ordered list of tasks pertaining to each bug

	# Creates basic method and instance vars
	attr_accessor :command

	def initialize
		@command = ""	
	end

	def home_screen
		while @command != ":q"
			puts "Enter command : (:q to quit)"
			@command = gets.to_s.strip
		end
	end
end

punchy = Punchy.new
punchy.home_screen
