require_relative '../lib/tn_validator.rb'
require "minitest/autorun"

class TestValidator < Minitest::Test
	def setup	
	end
	def test_fail_number_length
	
		assert !TN::Validator.valid?('1')[:result]
		
		
	end
	def test_fail_number_format
		assert_equal false, TN::Validator.valid?('1234567890123')[:result]
		
	end
	def test_fail_crc
		assert !TN::Validator.valid?('RD223479071CN')[:result]
	end
	def test_crc
		assert_equal 9, TN::Validator.calc_crc('41034224')
		assert_equal 2, TN::Validator.calc_crc('22347907')
	end
	def test_succ_validate
		r = TN::Validator.valid?('RD223479072CN')
		assert r[:result], r.inspect
	end
end