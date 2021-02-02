class Foo
    
    def self.hello
        'hello'
    end
end

class Bar < Foo
end

Foo.hello #=> "hello"
Bar.hello #=> "hello"