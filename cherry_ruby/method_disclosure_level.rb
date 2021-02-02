class User
    #デフォルトはpublic => class外から呼び出せる　initiarize以外は全て
    def hello
        "Hello!"
    end
end
user = User.new
user.hello #=> "Hello" #publicメソッドなのでクラス外から呼び出せる


class User
    #ここから下で定義されたメソッドはpublic
    private

    def hello
        'Hello'
    end
end
user = Uesr.new
user.hello #=> NoMethodError : private method 'hello' calld for


class User
    def hello
        #nameメソッドはprivateなのでselfをつけるとエラーになる プライベートメソッドに対しレシーバを指定してはいけない
        "Hello, I am #{self.name}."
    end
    
    private
    
    def name
        "Alice"
    end
end

user = User.new
user.hello #=> NoMethodError


class User
    def hello
        #selfなしでnameを呼び出す
        "Hello, I am #{name}"
    end

    private

    def name
        "Alice"
    end
end

user = User.new
user.hello #=> Hello, I am Alice #レシーバを指定していないためエラーにならない。多分直接アクセスも出来ない。