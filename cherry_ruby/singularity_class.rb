alice = 'I am Alice'
bob = "I am Bob."

#aliceのオブジェクトにだけ、shuffleメソッドを定義する
def alice.shuffle
    chars.shuffle.join
end

#aliceはshuffleメソッドを持つがbobは持たない
alice.shuffle #=> "m le a.icIA"
bob.shuffle #=> NoMethodError

#aliceというオブジェクトに対してのみshuffleメソッドを定義している
# 特定のオブジェクトにのみ紐づくメソッドのことを特異メソッドと呼ぶ
#　数値とシンボルだけは特異メソッドを定義出来ない

n = 1
 def n.foo
    'foo'
 end
#=> Type Error

sym = :alice
def sym.bar
    'bar'
end

#=> TypeError: can't define singlaton

#下記の方法でも特異メソッドを定義することが出来る
alice = "I am Alice"
#aliceというオブジェクトに特異メソッドを追加するもう一つの方法
class << alice
    def shuffle
        chars.shuffle.join
    end
end
alice.shuffle #=> " ci Ama.lIe"

#クラスメソッドの定義方法とよく似ている
#クラスメソッドを定義するコード例
class User
    def self.hello
        'Hello.'
    end

    class << self
        def hi
            'Hi.'
        end
    end
end

#特異メソッドを定義するコード例
alice = "I am alice."

def alice.hello
    'hello.'
end

class << alice
    def hi
        "Hi."
    end
end

#クラスメソッドの別の定義方法
class User
end

#クラス構文の外部でクラスメソッドを定義する方法1
def User.hello
    'Hello.'
end

#クラス構文の外部でクラスメソッドを定義する方法2
class << User
    def hi
        'Hi.'
    end
end

User.hello #=> "Hello"
User.hi #=> "Hi."