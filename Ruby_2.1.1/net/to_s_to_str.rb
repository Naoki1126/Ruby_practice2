class Person
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def to_str
        @name
    end
end

class NotStringPerson
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def to_s
        @name
    end

end


tanaka = Person.new("tanaka")
suzuki = NotStringPerson.new("suzuki")

puts "■ + 演算子利用時の to_str  呼び出し確認"
puts "tanaka name = " + tanaka

begin
    puts "suzuki name = " + suzuki
rescue => e
    puts e.message
    puts e.message
end