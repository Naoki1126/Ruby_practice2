class Product
    attr_reader :name, :price

    def initialize(name, price)
        @name = name
        @price = price
    end
end

product = Product.new('A great movie', 1000)
product.name #=> "A great movie"
product.price #=> 1000

# class DVD < Product
#     def initialize(name, price, running_time)
#         @name = name
#         @price = price
#         @running_time = running_time
#     end
# end

# dvd = DVD.new('A great movie',1000,120)
# dvd.name #=> 'A great movie'
# dvd.price #=> 1000
# dvd.running_time #=> 120

#これだとほとんど意味がない

class DVD < Product
    attr_reader :running_time

    def initialize(name, price, running_time)
        #スーパークラスのinitializeメソッドを呼び出す

        super(name,price)
        @running_time = running_time
    end
end

dvd = DVD.new("A great movie",1000,120)
dvd.name #=> "A great movie"
dvd.price #=> 1000
dvd.running_time #=> 120

class DVD < Product
    def initialize(name,price)
        super
    end
end

dvd.new("A great movie",1000)
dvd.name #=> "A great movie"
dvd.price #=> 1000


#---------エラー例-----------
class DVD < Product
    def initialize(name,price)
        # super() だと引数なしでスーパークラスのメソッドを呼び出す(Product Classのinitializeメソッドを呼び出す )
        #　ただし数が合わないのでコードはエラーになる。 (super(name,price)のように呼び出せばエラーにはならない)

        super()
    end
end
dvd = DVD.new("A great movie", 1000)
#---------エラー例-----------