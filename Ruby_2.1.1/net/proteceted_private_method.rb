# class C
#     def internal_use_private_and_protected
#         protected_method
#         private_method
#     end


#     def internal_use_private_and_protected_with_reciever
#         self.protected_method
#         self.private_method
#     end


#     def use_proteceted(other)
#         other.protected_method
#     end

#     protected
#     def protected_method
#         puts "proteceted_method"
#     end


#     private
#     def private_method
#         puts "private_method"
#     end
# end


# class D < C
# end

# c = C.new

# # # c.proteceted_method
# # c.private_method

# c.internal_use_private_and_protected
# c.internal_use_private_and_protected_with_reciever
# d = D.new
# d.use_proteceted(d)

class C
    protected

    def proteceted_method
        puts "proteceted_method"
    end

    private

    def private_method
        puts "private_method"
    end
end


class D < C

    def proteceted_method
        puts "after_overlide_protected_method"
    end

    def private_method
        puts "after_overlide_private_method"
    end
end

d = D.new
d.proteceted_method
d.private_method