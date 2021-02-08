module Loggabele
    def log(text)
        puts "[LOG] #{text}"
    end
end

class Product
    # Loggableモジュールのメソッドを特異メソッド（クラスメソッド）としてミックスインする
    extend Loggable

    def self.create_products(name)
        #log メソッドをクラスメソッド内で呼び出す
        #　つまりlogメソッド自体もクラスメソッドになっている
        log 'create_products is called.'
    end
end

#クラスメソッド経由でlogメソッドが呼び出される
Product.create_products([]) #=> [LOG] create_products is called

# Productクラスのクラスメソッドとして直接呼び出すことも可能
Product.log('Hello') #=> [Log]Hellog

class Product
    extend Loggable
    #logメソッドをクラス構文の直下で呼び出す
    # (クラスが読み込まれるタイミングで、このlogメソッドも実行される)
    log 'Defined Product class.'
end
#=> [LOG]Define Product class