class User
    #デフォルトはpublic => class外から呼び出せる　initiarize以外は全て
    def hello
        "Hello!"
    end
end
user = User.new
user.hello #=> "Hello" #publicメソッドなのでクラス外から呼び出せる


class User
    #ここから下で定義されたメソッドはpublic
    private

    def hello
        'Hello'
    end
end
user = Uesr.new
user.hello #=> NoMethodError : private method 'hello' calld for


class User
    def hello
        #nameメソッドはprivateなのでselfをつけるとエラーになる プライベートメソッドに対しレシーバを指定してはいけない
        "Hello, I am #{self.name}."
    end
    
    private
    
    def name
        "Alice"
    end
end

user = User.new
user.hello #=> NoMethodError


class User
    def hello
        #selfなしでnameを呼び出す
        "Hello, I am #{name}"
    end

    private

    def name
        "Alice"
    end
end

user = User.new
user.hello #=> Hello, I am Alice #レシーバを指定していないためエラーにならない。多分直接アクセスも出来ない。


class Product
    private

    def name
        'A great movie'
    end
end

class DVD < Product

    def to_s
        #nameはスーパークラスのprivateメソッド
        "name: #{name}"
    end
end

dvd = DVD.new

dvd.to_s #=> "name: A great movie" #内部でスーパークラスのPrivateメソッドを呼んでいるがエラーにならない


class Product
    def to_s
        "name: #{name}"
    end
    
    private

    def name
        'A greate movie'
    end
end

class DVD < Product
    private

    #スーパークラスのprivateメソッドをオーバーライドする
    def name
        "An awesome film"
    end
end

product = Product.new

#Productクラスのnameメソッドが使われる
product.to_s #=> "name: A great movie"

dvd = DVD.new
#オーバーライドしたDVDクラスのnameメソッドが使われる。
dvd.to_s #=> "name: An awesome film"


class User
    private
    
    def self.hello
        "Hello"
    end
end

#クラスメソッドはprivateでもプライベートにならない
User.hello #=> Hello


class User
    class << self
    #class << self の構文ならクラスメソッドでもprivateメソッドにできる
        private

        def hello
            "Hello"
        end
    end
end
User.hello #=> NoMethodError


class User
    def self.hello
        'hello'
    end

    #後からクラスメソッドをprivateに変更する
    private_class_method :hello
end

User.hello #=> NomethodError


#after metod disclosure change

class User

    def foo
        'foo'
    end

    def bar
        'bar'
    end

    #fooとbarをprivateメソッドに変更する
    #private はメソッドなので引数としてメソッド名を渡すことができる
    private :foo, :bar

    #bazはpublicメソッド

    def baz
        'baz'
    end
end

user = User.new
user.foo #=> NomethodError
user.bar #=> NomethodError
user.baz #=> baz


#protected method  クラス自身とそのサブクラスのインスタンスメソッドからレシーバー付きで呼び出せる

class User
    #weightは外部に公開しない
    attr_reader :name

    def initialize(name, weight)
        @name = name
        @weight = weight
    end

    def heavier_than?(other_user)
        other_user.weight < @weight
    end

    protected

    #protectedメソッドなので同じクラスかサブクラスであればレシーバ付きで呼び出せる
    def weight
        @weight
    end
end

alice = User.new('Alice', 50)
bob = User.new('Bob',60)

#AliceはBobのweightを取得できない
alice.heavier_than?(bob) #before protected
#=> NomethodError; undefind method 'weight'

#同じクラスのインスタンスメソッドであればweightが呼び出せる
alice.heavier_than?(bob) #=> false (after protected)
bob.heavier_than?(alice) #=> true  (after protected)

#クラスの外ではweightは呼び出せない
alice.weight #=> NomethodError: proteceted method "weight"
        
