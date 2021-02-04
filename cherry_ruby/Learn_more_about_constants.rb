class Product
    DEFAULT_PRICE - 0
end

Product::DEFAULT_PRICE #=> 0

# for private
class Product
    DEFAULT_PRICE = 0
    private_constant :DEFAULT_PRICE
end

Product::DEFAULT_PRICE #=> NameError

#Constants cannot be created inside a class
class Product
    def foo
        #メソッドの内部で定数を作成すると構文エラーになる
        DEFAULT_PRICE = 0
    end
end
#=> Syntax Error


# Can be reassigned to constants 定数には再代入が可能
class Product
    DEFAULT_PRICE = 0
    DEFAULT_PRICE = 100
end
#=> Warning alreay initialized constant Product::DEFAULT_PRICE

Product::DEFAULT_PRICE #=> 1000　再代入後の値が返る

#クラスの外部からでも再代入が可能
Product::DEFAULT_PRICE = 3000
#=> Warning alreay initialized constant Product::DEFAULT_PRICE

Product::DEFAULT_PRICE #=> 3000

#クラスを凍結する
Product.freeze

#freezeすると変更できなくなる。
Product::DEFAULT_PRICE = 5000 #=> RuntimeError: cant modify frozen Class:Product

class Product
    DEFAULT_PRICE = 1000
    freeze #ただしfreezeをするとメソッドの定義も出来なくなるためfreezeは使わない
    DEFAULT_PRICE = 3000 #=> RuntimeError: cant modify frozen Class:Product
end
