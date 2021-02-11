module NameChanger
    def change_name
        # include先のクラスのインスタンス変数を変更する
        @name = "アリス"
    end
end

class User
    include NameChanger

    attr_reader :name

    def initialize(name)
        @name = name
    end
end
user = User.new('alice')
user.name #=> 'alice'

#モジュールで定義したメソッドでインスタンス変数を書き換える
user.change_name
user.name  #=> "アリス"

module NameChanger
    def change_name
        # セッターメソッド経由でデータを変更する
        self.name = 'アリス'
    end
end

class User
    include NameChanger

    #ゲッターメソッドとセッターメソッドを用意する
    attr_accessor :name

    def initialize(name)
        @name = name
    end
end

# User クラスの使い方は先ほどと同じ
user = User.new('alice')
user.change_name
user.name #=> "アリス"

#Mix in directly to the object

module Loggable
    def log(text)
        puts "[log] #{text}"
    end
end

s = "abc"

#文字列は通常logメソッドを持たない
s.log('Hello') #=> NoMethodError

#　文字列sにLoggableモジュールのメソッドを特異メソッドとしてミックスインする
s.extend(Loggable)

# Loggableモジュールのlogメソッドが呼び出せるようになる
s.log('Hello.') #=> [Log]Hello.
