class Punchy
	# Punchy runs the command line stuff, triggers projects and tasks classes
	#   Project		Gungho-Guides folder containing 
	#     |_Feature		features.md headings are features, paragraphs under are descriptions of tasks
	#     | |_Tasks		Ordered list of tasks pertaining to each feature
	#     |
	#     |_Bugs		bugs.md headings are bugs, paragraphs under are descriptions of tasks
	#       |_tasks		Ordered list of tasks pertaining to each bug

	# Creates basic method and instance vars
	attr_accessor :command, :numDirectories

	def initialize
		@command = ""	
		@directories = Array.new 
	end

	# Lists all the directories in the current path not starting with a "."
	def directory_listing
		Dir.foreach('.') do |f|
			if f[0] != "."
				if File.directory?(f)
					@directories[@directories.size] = f
					puts "[#{@directories.size}] - #{f}"
				end
			end
		end
	end

	def home_screen
		while @command != ":q"
			self.directory_listing

			puts "Enter command : (:q to quit)"
			@command = gets.to_s.strip
			commandI = @command.to_i
			
			if commandI <= (@directories.size) && commandI > 0
				puts "You selected #{@directories[commandI]}"
			end

			@directories = Array.new
		end
	end
end

punchy = Punchy.new
punchy.home_screen
