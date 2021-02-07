#Stringクラスを継承した独自クラスを定義する
class MyString < String
    # Stringクラスを拡張するためのコードを書く
end

s = MyString.new('Hello')
s #=> Hello
s.class #=> MyString

#Arrayクラスを継承した独自クラスを定義する
class MyArray < Array
    # Arrayクラスを拡張するためのコードを書く
end

a = MyArray.new()
a << 1
a << 2
a #=> [1,2]
a.class #=> MyArray

class String
    #文字列をランダムにシャッフルする
    def shuffle
        chars.shuffle.join
    end
end

s = "Hello, I am Alice"
s.shuffle #=> "e l .iaIlAce lm,Ho"
s.shuffle #=> " m,eeA cal Hil.Ilo"