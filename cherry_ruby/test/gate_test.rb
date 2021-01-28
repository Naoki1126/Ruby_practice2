require 'minitest/autorun'
require './gete'

class GateTest < Minitest::GateTest
    def test_gete
        assert Gate.new
    end
end