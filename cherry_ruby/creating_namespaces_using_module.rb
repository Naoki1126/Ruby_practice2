#野球の二塁手という意
class Second
    def initialize(player, uniform_number)
        @player = player
        @uniform_number = uniform_number
    end
end

#時計の秒という意
class Second
    def initialize(digits)
        @digits = digits
    end
end

#二塁手のAliceを作成したい(が、区別できない)
Second.new('Alice', 13)

#時計の針の13秒を作成したい(が、区別できない)
Second.new(13)

module Bassball
    #コレはBaseballモジュールに属するSecondクラス
    class Second
        def initialize(player, uniform_number)
            @player = player
            @uniform_number = uniform_number
        end
    end
end

module Clock
    #コレはClockモジュールに属するSecondクラス
    class Second
        def initialize(digits)
            @digits = digits
        end
    end
end

#二塁手のAliceを作成する(区別できる)
Baseball::Second.new('Alice', 13)
Clock::Second.new(13)


#既に他で親moduleが作成されている場合はネストの必要はない

#既に定義されている
module Baseball
end

class Baseball::Second
    def initialize(player, uniform_number)
        @player = player
        @uniform_number = uniform_number
    end
end


#意地悪な例

#トップレベルのSecondクラス
class Second
    def initialize(player, uniform_number)
        @player = player
        @uniform_number = uniform_number
    end
end

module Clock
    #ClockモジュールのSecondクラス
    class Second
        def initialize(digits)
            @digits = digits

            #トップクラスのSecondクラスのインスタンスを作成したい。
            @baseball_second = Second.new('Clock', 10)
        end
    end
end

#当然失敗する
Clock::Second.new(13) #=> ArugumentError
#@baseball_second の引数が足りていないことになる

#解決方法
module Clock
    class Second
        def initialize(digits)
            @digits = digits
            #クラス名の前に::を付けるとトップレベルのクラスを指定したことになる
            @baseball_second = ::Second.new('Clock', 10)
        end
    end
end
