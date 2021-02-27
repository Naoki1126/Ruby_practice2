class Roulette
    def method_missing(name, *args)
        person= name.to_s.capitalize
        3.times do
            number = rand(10) + 1
            puts "#{number}"
        end
        "#{person} got a #{number}"
    end
end


#上記無限ループを起こす

#改良版
class Roulette
    def method_missing(name,*args)
        person = name.to_s.capitalize
        super unless %w[Bob Frank Bill].include? person
        number = 0
        3.times do
            number = rand(10) + 1
            puts "#{number}..."
        end
        "#{person} got a #{number}"
    end
end