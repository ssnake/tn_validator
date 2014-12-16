require_relative '../lib/core.rb'
require "minitest/autorun"

class TestValidator < Minitest::Test
	def setup	
	end
	def test_fail_number_length
	
		assert !UPU_S10::Validator.valid?('1')[:result]
		
		
	end
	def test_fail_number_format
		assert_equal false, UPU_S10::Validator.valid?('1234567890123')[:result]
		
	end
	def test_fail_crc
		assert !UPU_S10::Validator.valid?('RD223479071CN')[:result]
	end
	def test_crc
		assert_equal 9, UPU_S10::Validator.calc_crc('41034224')
		assert_equal 2, UPU_S10::Validator.calc_crc('22347907')
	end
	def test_succ_validate
		r = UPU_S10::Validator.valid?('RD223479072CN')
		assert r[:result], r.inspect
	end
end