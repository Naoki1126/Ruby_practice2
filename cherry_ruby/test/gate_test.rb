require 'minitest/autorun'
require './gate'

class GateTest < Minitest::Test
    def test_gete
        assert Gate.new
    end
end