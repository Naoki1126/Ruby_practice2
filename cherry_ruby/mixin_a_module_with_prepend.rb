module A
    def to_s
        "<A> #{super}"
    end
end

class Product
    # includeではなくprependを使う
    prepend A

    def to_s
        "<Product> #{super}"
    end
end

product = Product.new
product.to_s #=> "<A> <Product>"

#includeでモジュールAをミックスインした場合
product.to_s #=> "<Product> <A>"

#prependを使用した場合
Product.ancestors #=> [A, Product, Object, Kernel, BasicObject]

#include した場合
Product.ancestors #=> [Product, A, Object, Kernel, BasicObject]

#メソッド探索の順位がprependを使用した場合はmoduleメソッドが最優先される