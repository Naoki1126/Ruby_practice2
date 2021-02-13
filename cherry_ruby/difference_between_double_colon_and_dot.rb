module Sample
    class User
        NAME = "Alice".freeze
        
        def self.hello(name = NAME)
            "Hello, I am #{name}"
        end
    end
end

# namespaceや定数を参照するときは二重コロン、メソッドは.
 Sample::User::NAME #=> Alice
 Sample::User.hell #=> "Hello, I am Alice"

 # メソッド呼び出しに二重コロンを使うこともできる
 Sample::User::hello #=> "Hello, I am Alice"

 # メソッドはドットでなくても呼び出すことができる
 s = 'abc'
 s::upcase #=> "ABC"

 #ただドットと二重コロンは同じ役割ではない
 #ドットは名前空間を区切ったり、定数を参照したりには使えない

 #Sample.UserだとUserがメソッドとみなされる
 Sample.User::NAME #=> NoMethodError: undefined method 'User'

 #User.NAMEがNAMEがメソッドと見なされる
 Sample::User.NAME #-> NoMethodError: undefined method 'Name'