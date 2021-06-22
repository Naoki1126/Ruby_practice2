# class C
#     private
#     def output_c
#         puts "c"
#     end
#     public
#     def output_f
#         output_c
#     end
# end

# class D < C
#     def output_c
#         puts 'output'
#     end

#     def output_d
#         output_c
#     end

# end


# instance = D.new
# instance.output_f
# test_instance = C.new
# test_instance.output_f


# class User
#     attr_reader :name

#     def initialize(name, weight)
#         @name = name
#         @weight = weight
#     end

#     def heavier_then?(other_user)
#         other_user.weight < @weight
#     end

#     protected

#     def weight
#         @weight
#     end

# end

# alice = User.new("Ailce", 50)
# bob = User.new("BOb",60)

# p alice.heavier_then?(bob)
# p bob.heavier_then?(alice)

# alice.weight


class C
    @@a = 1


    class << self
        @@a = 3

        def out_put_class_valiables
            p @@a
        end
    end

    def self.out_put
        @@a = 5
    end

    def out_put_class_valiables
        p @@a
    end
end

class D < C
    @@a = 2
    def out_put
        @@a = 1
        p @@a
    end
end

C.out_put_class_valiables
C.new.out_put_class_valiables
D.new.out_put


