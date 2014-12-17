module TN

	class Validator
		
		MASK = /(?<prefix>[a-z]{2})(?<number>\d{8})(?<crc>\d)(?<suffix>[a-z]{2})/i
		class << self

			def valid? number
				r = check number
				{ result: r == :OK, code: r, msg: Message.msg(r)}

			end
			def calc_crc number
		    	crc = 
		    		number[0].to_i * 8 + 
		    		number[1].to_i * 6 + 
		    		number[2].to_i * 4 + 
		    		number[3].to_i * 2 + 
		    		number[4].to_i * 3 + 
		    		number[5].to_i * 5 + 
		    		number[6].to_i * 9 + 
		    		number[7].to_i * 7
		    	crc = crc % 11
		    	11 - crc
		    end
		private
		    def check_length number
		    	number.length == 13
		    	
		    end
		    def check_format number
		    	v = number =~ MASK
		    end
		    def check_crc number
		    	m =MASK.match number 

		    	m[:crc].to_s == calc_crc(m[:number]).to_s


		    
		    
		    end
			def check number
				return :BAD_LENGTH unless check_length number
				return :BAD_FORMAT unless check_format number
				return :BAD_CRC unless check_crc number

				return :OK
				
			end		    
		end
	end
	class Message

		class << self
			def msg code
				case code
					when :OK
						'ok'
					when :BAD_FORMAT
						'Number format is bad. It must be XX123456789XX' 
					when :BAD_LENGTH
						'Number length is wrong. It must be 13 letters'
					when :BAD_CRC
						'Incorrect crc number'
					else
						''
				end
			end
		end
	end
end