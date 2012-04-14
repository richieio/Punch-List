class Punchy
	# Punchy runs the command line stuff, triggers projects and tasks classes
	#   Project		Gungho-Guides folder containing 
	#     |_Feature		features.md headings are features, paragraphs under are descriptions of tasks
	#     | |_Tasks		Ordered list of tasks pertaining to each feature
	#     |
	#     |_Bugs		bugs.md headings are bugs, paragraphs under are descriptions of tasks
	#       |_tasks		Ordered list of tasks pertaining to each bug

	# Creates basic method and instance vars
	attr_accessor :command, :numDirectories, :currentDirectory

	def initialize
		@command = ""	
		@directories = Array.new 
		@currentDirectory = Dir.getwd
	end

	# Lists all the directories in the current path not starting with a "."
	def directory_listing
		Dir.glob('*') do |f|#go through all the files in the directory that don't start with a "."
				if File.directory?(f)#if file is a directory, then it's a project
					@directories[@directories.size] = f#add the file to the directory arrray
					puts "[#{@directories.size}] - #{f}"#display the directory and the number associated to it
				end
		end
	end

	#the menu to be looped through
	def display_menu
		puts ""
		puts "You are currently in #{@currentDirectory}"
		puts "Enter the number next to the project file to open that project, :q to quit"
		puts ""
	end

	#handle what the user inputed
	def input
		@command = gets.to_s.strip #must strip to get rid of \n when user hits enter
		commandI = @command.to_i #convert input to integer to see what number they pressed
		
		if commandI <= (@directories.size) && commandI > 0 #many strings will convert to integer 0, therefore we cannot use 0 as a number to be used
			puts "You selected #{@directories[commandI]}"
		end
	end

	def home_screen #the main controller for punchy
		while @command != ":q"
			self.display_menu

			self.directory_listing
			
			self.input

			@directories = Array.new
		end
	end
end

punchy = Punchy.new
punchy.home_screen
