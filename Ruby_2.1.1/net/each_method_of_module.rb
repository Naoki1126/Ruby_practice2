# p Class.constants
# p Object.const_defined?(:ENV)
# # p Object.constants

# p Object.const_get(:RUBY_VERSION)

# Object.const_set(:MY_CONST,"my_const")
# p Object::MY_CONST

# # class Myclass
# #     MYCONST = 1
# #     p remove_const(:MYCONST)
# #     p MYCONST
# # end


# # p Array.ancestors

# # p Array.instance_methods

# class MyClass
#     private
#     def foo
#         puts "foo"
#     end

#     public :foo
# end

# my_class = MyClass.new
# my_class.foo


# class Myclass
#     def foo
#         'foo'
#     end

#     alias_method :org_foo, :foo

#     def foo
#         'bar' + org_foo
#     end
# end

# # m = Myclass.new
# # p m.foo

# Array.class_eval do
#     def foo
#         p 'bar'
#     end
# end

# [].foo

# class MyClass
#     CONST = 1
# end

# MyClass.class_exec(3){ |i| puts i + self::CONST}


# class MyClass
#     @@foo = 1
# end

# p MyClass.class_variables


# p MyClass.class_variable_defined?(:@@foo)

# class MyClass
#     @@var = "foobar"
# end


# def MyClass.get
#     class_variable_get(:@@var)
# end

# def MyClass.set=(var)
#     class_variable_set(:@@var,var)
# end

# def MyClass.clear
#     remove_class_variable(:@@var)
# end

# p MyClass.get
# p MyClass.clear
# # p MyClass.get
# MyClass.set = "newvar"
# MyClass.ge

module MyModule
    def self.included(object)
        p "#{object} has include #{self}"
    end

    def self.extended(object)
        p "#{object} has extend #{self}"
    end
end


class MyClass
    include MyModule
    extend MyModule
end

p MyClass.include?(MyModule)
# p MyClass.extended?(MyModule)
p MyClass.included_modules
# p MyClass.extended_modules

