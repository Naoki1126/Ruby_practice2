def to_aplhanumeric(s)
    s.gsub(/[^\w\s]/,'')
end

require 'test/unit'

class ToAlphanumericTest < Test::Unit::Testcase
    def test_strip_non_alphanumeric_characters
        assert_equal '3 the Magic Number', to_aplhanumeric('#3, the *Magic, Number*?')
    end
end


class String
    def to_aplhanumeric
        gsub(/[^\w\s]/, '')
    end
end
#オーブンクラス

require 'test/unit'
class ToAlphanumericTest < Test::Unit::Testcase
    def test_strip_non_alphanumeric_characters
        assert_equal '3 the Magic Number','#3, the *Magic, Number*?'.to_aplhanumeric
    end
end


