# 以下のProductクラスは外部ライブラリで定義されている想定
class Product
    def name
        "A great film"
    end
end

# 変更前のnameメソッドの実行結果
product = Product.new
product.name #=> "A great film"

# 既存メソッドを変更するためにProductクラスを再オープンする
class Product
    #既存のnameメソッドはname_originalという名前で呼び出せる
    alias name_original name

    def name
        "<<#{name_original}>>"
    end
end

# 変更後のnameメソッドの実行結果
product.name #=> "<<A great film>>"


#上のコードはモジュールとprependを組み合わせることで、エイリアスメソッドの定義を無くすことができる

# 以下のProductクラスは外部ライブラリで定義されている想定
class Product
    def name
        "A great film"
    end
end

#prependするためのモジュールを定義する
module NameDecorator
    def name
        # prependするとsuperはミックスインした先のクラスのnameメソッドを呼び出す
        "<<#{super}>>"
    end
end

# 既存メソッドを変更するためにproductクラスを再オーブンする
class Product
    # includeではなくprependでミックスインする
    prepend NameDecorator
end

# エイリアスメソッドを使った場合と同じ効果が得られる
product = Product.new
product.name #=> "<< A great film>>"


#productクラスと同じようにnameメソッドを持つクラスがあったとする
class User
    def name
        'Alice'
    end
end

class User
    #  prependを使えばUserクラスのnameメソッドも置き換えることができる。
    prepend NameDecorator
end

# Userクラスのnameメソッドを上書きすることができた。
user = User.new
user.name #=> "<<Alice>>"
