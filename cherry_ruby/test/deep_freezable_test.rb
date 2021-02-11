require 'minitest/autorun'
# require './deep_freezable'
require './bank'
require './team'

class DeepFreezableTest < Minitest::Test
    def test_deep_freeze_to_array
        #配列の値は正しいか？
        assert_equal ["Japan","US","India"], Team::COUNTRIES
        #配列自身がfreezeされているか?
        assert Team::COUNTRIES.frozen?
        #配列の要素が全てfreezeさているか?
        assert Team::COUNTRIES.all? { |country| country.frozen?}
    end

    def test_deep_freeze_to_hash
        #ハッシュの値は正しいか
        assert_equal(
            { 'Japan' => 'yen', 'US' => 'doller', "India" => "rupee"},
            Bank::CURRNCIES
        )
        #ハッシュ自身がfreezeされているか
        assert Bank::CURRNCIES.frozen?

        #ハッシュの要素(キーと値)が全てfreezeされているか
        assert Bank::CURRNCIES.all?{ |key,value| key.frozen? && value.frozen? }
    end
end
