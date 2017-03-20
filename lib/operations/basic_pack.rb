module Operations
	module BasicPack
	  def op__append s = ""
	  	w = @content + s.to_s
	  	update w
	  end
		def op__delete k
			idx = (k.to_i * -1) - 1
			s = @content[0..idx]
			update s
		end
		def op__print k
			puts @content[k.to_i - 1]
		end
		def op__undo
			@content = @history.pop || ""
			@content
		end
	private
		def update s
			@history << @content
			@content = s
    end
	end
end