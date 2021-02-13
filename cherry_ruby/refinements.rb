#Rubyでは既存クラスのメソッドを簡単にオーバーライドできてしまう
#便利ではあるが少々危険であるため、有効範囲を狭めなければならない
#そんな時に使用できるのがrefinements

module StringShuffle
    #refinementsが目的なのでrefineメソッドを使う
    refine String do
        def shuffle
            chars.shuffle.join
        end
    end
end

#通常はStringクラスにshuffleメソッドはない
'Alice'.shuffle #=> NoMethodError

class User
    # refinementsを有効にする
    　using StringShuffle

    def initialize(name)
        @name = name
    end

    def shuffle_name
        # Userクラスの内部であればStringクラスのshuffleメソッドが有効になる
        @name.shuffle
    end

    # Userクラスを抜けるとrefinementsは無効になる

end

user = User.new('Alice')
# Userクラス内ではshuffleメソッドが有効になっている
user.shuffled_name #=> "clAei"

#Userクラスを経由しない場合はshuffleメソッドは使えない
"Alice".shuffle #=> NoMethodError: undefined method 'shuffle' for "Alice":string

###########################################################


#StringShuffleモジュールを読み込む
require './string_shuffle'

#ここではまだshuffleメソッドが使えない
# puts 'Alice'.shuffle

#トップレベルでusing すると、ここからファイルの最後までshuffleメソッドが有効になる
using StringShuffle

puts 'Alice'.shuffle #=> ecAli

class User
    def initialize(name)
        @name = name
    end

    def shuffled_name
        @name.shuffle
    end
end

user = User.new('Alice')
puts user.shuffled_name #=> ecAli

puts 'Alice'.shuffle #ecliA

################################################################

module SomeModule
    # Ruby 2.4からはモジュールもrefine可能
    refine Enumerable do
        # Enumerableモジュールに対する変更
    end
end
