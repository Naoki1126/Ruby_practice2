#以下のコードはメソッドが呼ばれたタイミングでログを残そうとする2つのクラス

class Product
    def title
        log 'title is called.'
    end
    
    private
    def log(text)
        # 本来であれば標準ライブラリのLoggerクラスなどを使うべきだが、簡易的にputsで済ませる
        puts "[Log] #{text}"
    end
end

class User
    def name
        log 'name is called.'
    end

    private

    #このメソッドの実装はProductクラスのlogメソッドと全く同じ
    def log(text)
        # 本来であれば標準ライブラリのLoggerクラスなどを使うべきだが、簡易的にputsで済ませる
        puts "[Log] #{text}"
    end
end

product = Product.new
product.title
#=> [LOG] title is callde.
# "A grate movie"

user = User.new
user.name
#=> [LOG] name is called.
# "Alice"

#上のコードは重複しているが、無闇に継承を使うべきでは無い。継承関係が成り立たない。

#ログ出力用のモジュールを定義する

module Loggable
    def log(text)
        puts "[Log] #{text}"
    end
end

class Product
    #上で作ったモジュールをincludeする
    include Loggable

    def title
        #logメソッドはLoggableモジュールで定義したメソッド
        log 'title is called'
        'A great movie'
    end
end

class User
    # こちらも同じようにincludeする
    include Loggable

    def name
        # Loggabelモジュールのメソッドが使える
        log 'name is called'
        'Alice'
    end
end

product = Product.new
product.title
#=> [Log] title is calld.
# "A great movie"

user = User.new
user.name #=> [LOG] name is called
# Alice

#ただこのままだとlogメソッドがpublicメソッドになり、クラスの外から呼び出せてしまう。

module Loggable
    #logメソッドはprivateメソッドにする 
    private

    def log(text)
        puts "[LOG] #{text}"
    end
end

class Product
    include Loggable

    #省略
end
# log メソッドはprivateメソッドなので外部から呼び出せない
product.log 'public?'
#=> NoMethodError: priavete method 'log'