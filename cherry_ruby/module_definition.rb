# hello メソッドを持つGreeterモジュールを定義
module Greeter
    def hello
        'hello'
    end
end

# greeter = Greeter.new #=> NoMethodError インスタンスを作成することは出来ない。
# module AweSomeGreeter < Greeter #=> Syntax Error モジュールを継承してモジュールを作成することは出来ない

