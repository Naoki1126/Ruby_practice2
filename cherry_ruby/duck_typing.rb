 def display_name(object)
    puts "Name is << #{object.name}"
 end

class User
    def name
        'Alice'
    end
end

class Product
    def name
        'A great movie'
    end
end

#UserクラスとProducクラスはお互いに無関係なクラスだが、display_nameメソッドは何も気にしない
user = User.new
display_name(user) #=> Name is <<Alice>>

product = Product.new
display_name(product) #=> Name is <<A great movie>>

#オブジェクトのクラスが何であろうとそのメソッドが呼び出せれば良しとするスタイルをダックタイピングと呼ぶ


class Product
    def initialize(name,price)
        @name = name
        @price = price
    end

    def display_text
        # stock?メソッドはサブクラスで必ず実装してもらう想定
        stock = stock? ? 'あり' : 'なし'
        "商品名: #{@name} 価格: #{@price}円 在庫: #{stock}"
    end
end

class DVD < Product
    #在庫があればtrueを返す
    def stock?
        # (本当はデータベースに問い合わせるなどの処理が必要だがここでは省略)
        true
    end
end

product = Product.new('A great film', 1000)
#スーパークラスはstock?メソッドを持たないのでエラーになる
product.display_text #=> NoMethodError: undefinde method 'stock?'

dvd = DVD.new('An awesome film', 3000)
#サブクラスはstock?メソッドを持つのでエラーが起きない
dvd.display_text #=> "商品名: An awesome film 価格: 3000円 在庫: あり"

#ruby が気にするのはそのメソッドを呼び出せるかどうかだけ
#このままだと何も知らない人に対して不親切なコードになるため、Productクラス内でもstock?メソッドを定義する場合がある
class Product
    # 省略

    def stock?
        # 「サブクラスでstock?メソッドを実装すること」というメッセージとともにエラーを発生させる
        raise "Must implement stock? in subclass."
    end
end

product = Product.new('A great film', 1000)
product.display_text #=> RuntimeError: Must implement stock? in subclass
#このようにすればサブクラスで必ずstock?メソッドを定義しないといけないことが伝わる。


#メソッドの有無を調べる
s = "Alice"

#Stringクラスはsplitメソッドを持つ
s.respond_to?(:split) #=> true

#nameメソッドは持たない
s.respond_to?(:name) #=> false

def display_name(object)
    if object.respond_to?(:name)
        #name メソッドが呼び出せる場合
        puts "Name is <<#{object.name} >>"
    else
        #nameメソッドが呼び出せない場合
        puts "No name."
    end
end

#Rubyでメソッドのオーバーロード?

def add_ten(n)
    #nが整数以外の場合にも対応するためto_iで整数に変換する
    n.to_i + 10
end

#整数を渡す
add_ten(1) #=> 11

#文字列がnilを渡す
add_ten('2')
add_ten(nil)

#引数にデフォルト値を付ける
def add_numbers(a = 0, b = 0)
    a + bar
end

#引数の個数はゼロでも1個でも2個でも良い　
add_numbers #=> 0
add_numbers(1) #=> 1
add_numbers(1,2) #=> 3
