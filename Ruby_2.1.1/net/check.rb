# module MyModule
#     def class_method; puts "OK";end
# end

# module MyModule2
#     def inst_method; puts "instance_method OK";end
# end

# class MyClass

#     extend MyModule

#     include MyModule2
# end


# class MyClass2 < MyClass
# end

# # MyClass.class_method

# # MyClass2.class_method

# # mc2 = MyClass2.new
# # mc2.inst_method


# module M
#     def method; puts 'module M'; super; end
# end

# class ParentClass
#     def method; puts "class ParentClasss"; end
# end

# class ChildClass < ParentClass
#     include M
#     def method; puts "class ChildClass";super; end
# end


# ChildClass.new.method
# puts ChildClass.superclass

# class ParentClass
#     private
#     def m; puts "OK"; end
# end

# class ChildClass < ParentClass
#     def m
#         super
#     end

#     def m2
#         m
#     end
# end


# child_class = ChildClass.new
# child_class.m
# child_class.MyClass2

class C
    @v = 1
    CONST = 11212
    def m
        @v = 2
    end

    class << C
        CONST = 111

        def m
            CONST
        end
    end

end

p C.m
p C.new.m
# class << C
#     p @v
# end