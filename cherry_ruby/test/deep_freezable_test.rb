require 'minitest/autorun'
# require './deep_freezable'
require './bank'
require './team'

class DeepFreezableTest < Minitest::Test
    def test_deep_freeze_to_array
        #配列の値は正しいか？
        assert_equal ["Japan","US","India"], Team::COUNTRIES
        #配列自身がfreezeされているか?
        assert Team::COUNTRIES.fozen?
        #配列の要素が全てfreezeさているか?
        assert Team::COUNTRIES.all? { |country| country.frozen?}
    end
end
