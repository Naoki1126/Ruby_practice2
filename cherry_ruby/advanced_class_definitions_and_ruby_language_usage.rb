class User
    def hello
        'hello'
    end

    #Helloメソッドのエイリアスメソッドとしてgreetingを定義する
    alias greeting hello
end

user = User.new
user.hello #=> 'hello'
user.greeting #=> 'hello'

#objectクラスで定義されているfreezeメソッドを削除する
class User
    #freezeメソッドの定義を削除する
    undef freeze
end

user = User.new
user.freeze #=> NoMethodError

#ネストしたクラスの定義
class User
    class BloodType
        attr_reader :BloodType

        def initialize(type)
            @type = type
        end
    end
end

blood_type= User::BloodType.new("B")
blood_type.type #=> "B"

#クラスの可視性について
class User
    #このようなクラス定義はエラーになる
    private class BloodType
    end
end

#=> TypeError クラスに対してprivateは定義できない。

#演算子の挙動を独自に再定義する

class User
    # =で終わるメソッドを定義する
    def name=(value)
        @name = value
    end
end

user = User.new
#変数に代入するような形式でname=メソッドを呼び出せる
user.name = 'Alice'

class Product
    attr_reader :code, :name

    def initialize(code, name)
        @code = code
        @name = name
    end
end

a = Product.new('A-0001', "A great movie")
b = Product.new("B-0001", "An awesome film")
c = Product.new("A-0001", "A great movie")

# == がこのように動作して欲しい
a == b #=> false
a == c #=> true
#これは通常だと全てfalse

a == a
b == b
c == c
#上記でなければtrueにはならない

#オーバーライドする
class Product
    attr_reader :code, :name

    def initialize(code, name)
        @code = code
        @name = name
    end

    def ==(other)
        if other.is_a?(Product)
            # 商品コードが一致すれば同じProductとみなす
            code == other.code
        else
            # otherがProductでなければ常にfalse
            false
        end
    end
end

a = Product.new('A-0001', "A great movie")
b = Product.new("B-0001", "An awesome film")
c = Product.new("C-0001", "A great movie")

#商品コードが一致すればtrueになる
a == b #=> false
a == c #=> true

#Product以外の比較はfalse
a == 1 #=> false
b == 'a' #=>

#==はメソッドなので.付きで呼び出しても普通に動作する
a.==(b) #=> false
a.==(c) #=> true

# 左辺にあるのが整数なので、Integerクラスの==が呼び出される。
1 == a #=> false

#等値を判断するメソッド

a = "abc"
b = "abc"

c = a
a.equal?(c) #=> true
# equalは同じオブジェクトIDを持つものがtrueになる

1 == 1.0 #= true
#オブジェクトの内容が同じであればtrueを返す

#eql? ハッシュのキーとして二つの値が等しいかどうかを判断する == とは違う

h = {1 => 'Integer', 1.0 => "Float"}
h[1] #=> Integer
h[1.0] #=> Float
1.eql?(1.0) #=> false

#こちらはデータとデータ型が同じでなければtrueにならない

