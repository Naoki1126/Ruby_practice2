#メソッド探索の例

module A
    def to_s
        "<A> #{super}"
    end
end

module B
    def to_s
        "<B> #{super}"
    end
end

class Product
    def to_s
        "<Product> #{super}"
    end
end

class DVD < Product
    include A
    include B

    def to_s
        "<DVD> #{super}"
    end
end

dvd = DVD.new
dvd.to_s #=> <DVD><B><A><Product>

DVD.ancestors #=> [DVD, B, A, Product, Object, Kernel, BasicObject]

#自クラス→includeModule →superClass → includeModule → superClass of superClass
