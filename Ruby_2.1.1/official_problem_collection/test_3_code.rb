# # # # # require "date"

# # # # # # t = Time.now + 1
# # # # # # p t >> 1

# # # # # d = Date.today
# # # # # p d >> 1

# # # # # d = DateTime.now
# # # # # p d >> 1


# # # # # Child.new.rem_method
# # # # # Child.new.und_method

# # # # # add = Proc.new { |x,y| puts x + y}

# # # # # add.call(1,2)
# # # # # add(1,3).call

# # # # 



# # # class Parent
# # #     def rem_method
# # #         puts "Hello rem_method"
# # #     end


# # #     def und_method
# # #         puts "Hello und_method"
# # #     end

# # # end


# # # class Child < Parent

# # #     def rem_method
# # #         puts "child rem_method"
# # #     end


# # #     def und_method
# # #         puts "child und_method"
# # #     end

# # #     undef und_method, rem_method
# # # end

# # # Parent.new.rem_method



# # # class A
# # #     val = 0

# # #     def output
# # #         val = 9
# # #         p val
# # #     end
# # # end

# # # A.new.output


# # module M
# #     def self.append_features(include_class_name)
# #         puts "append_features"
# #         super
# #     end

# #     def func
# #         p "Hello"
# #     end

# #     def greet
# #         p "Hello world"
# #     end
# # end

# # class C
# #     include M
# # end

# # # C.new.func
# # C.new.greet
# # C.new.greet

# class C
#     def initialize(str)
#         @str = str
#     end

#     def inspect
#         "inspect"
#     end

#     def to_s
#         "to-s"
#     end

#     def to_str
#         "to_str"
#     end
# end

# p C.new("")
# p "#{C.new("")}"
# p "" + C.new("")


# require 'json'

# json = <<-DATA
# ["red","green","blue"]
# DATA

# p JSON.parse(json)
# p JSON.dump(json)

# x,y = [0,1,2]
# x,*y = 1,2,3,4,5

# p x
# # p y

# def bar(a:,b: 100, **z)
#     p z
#     a + b
# end

# bar(a: 2, c: 100, d: 200)


print "a\nb"

p "aaa".object_id
p "aaa".object_id
p :aaa.object_id
p :aaa.object_id

a = [0,1,1,2,3]
a[0,2] = 10
p a