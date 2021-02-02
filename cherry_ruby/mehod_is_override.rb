class Product
    attr_reader :name, :price

    def initialize(name,price)
        @name = name
        @price = price
    end

    def to_s
        "name: #{name}, price: #{price}"
    end
end

class DVD < Product
    attr_reader :running_time

    def initialize(name,price,running_time)
        super(name, price)
        @running_time = running_time
    end

    def to_s
        "name: #{name},price: #{price},running_time: #{running_time}"
    end
end

product = Product.new("A great movie",1000)
product.to_s #=>  訳のわからない文字列が帰ってくる # to_s dose not exist in Procduct

product= Product.new("A great movie", 1000)
product.to_s #=> "name: Agreat movie, price: 1000"  # to_s exist in Product

dve = DVD.new('An awesome film', 3000,120)

dvd.to_s #=> "name: An awesome film, price: 3000" # before override to_s

dvd .to_s #=> "name: An awesome film, price: 3000,runningtime: 120" # after override to_s

#after refactoring


class DVD < Product
    attr_reader :running_time

    def initialize(name,price,running_time)
        super(name, price)
        @running_time = running_time
    end

    def to_s
        "#{super},running_time: #{running_time}"
    end
end

