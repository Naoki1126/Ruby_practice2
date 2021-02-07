class Product

    @@name = 'Product'

    def self.name
        @@name
    end

    def initialize(name)
        @@name = name
    end

    def name
        @@name
    end
end

class DVD < Product

    @@name = 'DVD'

    def self.name
        @@name
    end

    def upcase_name
        @@name.upcase
    end

end
#DVDクラスを定義したタイミングで@@nameが"DVD"に変更される
Product.name #=> "DVD"
DVD.name #=> "name"

product = Product.new('A great movie')
product.name #=> "A great movie"

# Product.newのタイミングで@@nameが"A great movie"に変更される
Product.name #=> "A great movie"
DVD.name

dvd = DVD.new('An awesome file')
dvd.name = "AN AWESOME FILM"
dvd.upacase_name #=> "AN AWESOME FILM"

# DVD.newのタイミングで@@nameが"An awesome film"に変更される
product.name #=> "An awesome film"に変更される
Product.name #=> "An awesome film"に変更される
DVD.name #=> "An awesome film"