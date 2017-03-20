require "simple_text_editor/version"
require "operations/basic_pack"

module SimpleTextEditor
	class Editor
		include Operations::BasicPack
		attr_reader :content, :history, :operations

	  def initialize s = ""
	    @content = s
	    @history = []
	    define_operations
	  end

	  def process(str)
	  	method_and_params = str.split(' ')
	  	method_and_params[0] = get_operation_by_code(method_and_params[0]) || "op__invalid"
	  	send(*method_and_params)
	  end	  
	  def op__invalid *args
	  	puts "An invalid operation was entered"
      puts "Please use one of the following:"
      @operations.each do |v,k|
				puts "#{k} - #{v}"
      end
	  end

		def define_operations
			@operations ||= {}
			@operations["1"] = "op__append"
			@operations["2"] = "op__delete"
			@operations["3"] = "op__print"
			@operations["4"] = "op__undo"
		end		
	private
		def get_operation_by_code code			
			return nil unless code			
			@operations[code]
		end

	end


	module Import		
		class HackerRankFile
		  def initialize filename
				f = File.open(filename, "r")
				q = f.gets.strip.to_i
				editor = SimpleTextEditor::Editor.new

				q.times do |i|
    			line = f.gets.strip
					editor.process line
				end				
				f.close
		  end		
		end
	end
end