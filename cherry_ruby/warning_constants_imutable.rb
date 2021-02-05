class Product
    NAME = "A Product"
    SOME_NAMES = ["Foo","Bar","Baz"]
    SOME_PRICE = {"Foo" => 1000, 'Bar' => 2000, 'Baz' => 3000 }
end

# 文字列を破壊的に大文字に変更する
Product::NAME.upcase!
Product::NAME #=> "A PRODUCT"

#配列に新しい要素を追加する
Product::SOME_NAMES << 'Hoge'
Product::SOME_NAMES #=> ["Foo", "Bar", "Baz", "Hoge"]

#ハッシュに新しいキーと値を追加する

Product::SOME_PRICE["HOGE"] = 4000
Product::SOME_PRICE #=> {"Foo" => 1000,"Bar" => 2000,"Baz" => 3000,"HOGE" => 4000}

#↑こちらはまだコードを見れば変更していることわかる。

class Product
    SOME_NAMES = ["Foo","Bar","Baz"]

    def self.names_without_foo(names = SOME_NAMES)
        # namesがデフォルト値だと、以下のコードは定数のSOME_NAMESを破壊的に変更していることになる
        names.delete("Foo")
        names
    end
end
Product.names_without_foo #=> ["Bar", "Baz"]

#定数の中身が変わってしまった
Product::SOME_NAMES #=> ["Bar", "Baz"]

#これを防ぐためにFreezeを使う

class Product
    #配列を凍結する
    SOME_NAMES = ['Foo', "Bar", "Baz"].freeze

    def self.names_without_foo(names = SOME_NAMES)
        # freezeしている配列に対しては破壊的な変更は出来ない
        names.delete('Foo')
        names
    end
end
#エラーが発生するのでうっかり定数の値が変更される事故が防げる
Product.names_without_foo #=> RuntimeError: cant modify frozen Aray

#これでも完璧ではない。配列自体はFreezeされても各要素はFreezeされない
class Product
    #配列はfreezeされるが中身の文字はFreezeされない
    SOME_NAMES = ['Foo','Bar','Baz'].freeze
end

#1番目の文字を破壊的に変更する
Product::SOME_NAMES[0].upcase!
#1番目の要素の値が変わってしまった！
Product::SOME_NAMES #=> ["FOO","Bar","Baz"]

#これを防ぎたい時

class Product
    #中身の文字もfreezeする
    SOME_NAMES = ['Foo'.freeze, "Bar".freeze, "Baz".freeze].freeze
end

#今度は中身もfreezeしているので破壊的な変更は出来ない
Product::SOME_NAMES[0].upcase! #=> RuntimeError

#after map
class Product
    #map メソッドで各要素をfreezeし、最後にmapメソッドの戻り値の配列をfreezeする
    SOME_NAMES = ["Foo","Bar","Baz"].map(&:freeze).freeze
end

class Product
    #数値やシンボル、true/falseはfreeze不要（しても構わないが、意味が無い)
    SOME_VALUE = 0
    SOME_TYPE = :foo
    SOME_FLAG = true
end

#Rubyの定数は「絶対変更できない値」ではなく、定数であっても「変更しようとすればいくらでもできる」