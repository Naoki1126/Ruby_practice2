# # # # # # # require "date"

# # # # # # # # t = Time.now + 1
# # # # # # # # p t >> 1

# # # # # # # d = Date.today
# # # # # # # p d >> 1

# # # # # # # d = DateTime.now
# # # # # # # p d >> 1


# # # # # # # Child.new.rem_method
# # # # # # # Child.new.und_method

# # # # # # # add = Proc.new { |x,y| puts x + y}

# # # # # # # add.call(1,2)
# # # # # # # add(1,3).call

# # # # # # 



# # # # # class Parent
# # # # #     def rem_method
# # # # #         puts "Hello rem_method"
# # # # #     end


# # # # #     def und_method
# # # # #         puts "Hello und_method"
# # # # #     end

# # # # # end


# # # # # class Child < Parent

# # # # #     def rem_method
# # # # #         puts "child rem_method"
# # # # #     end


# # # # #     def und_method
# # # # #         puts "child und_method"
# # # # #     end

# # # # #     undef und_method, rem_method
# # # # # end

# # # # # Parent.new.rem_method



# # # # # class A
# # # # #     val = 0

# # # # #     def output
# # # # #         val = 9
# # # # #         p val
# # # # #     end
# # # # # end

# # # # # A.new.output


# # # # module M
# # # #     def self.append_features(include_class_name)
# # # #         puts "append_features"
# # # #         super
# # # #     end

# # # #     def func
# # # #         p "Hello"
# # # #     end

# # # #     def greet
# # # #         p "Hello world"
# # # #     end
# # # # end

# # # # class C
# # # #     include M
# # # # end

# # # # # C.new.func
# # # # C.new.greet
# # # # C.new.greet

# # # class C
# # #     def initialize(str)
# # #         @str = str
# # #     end

# # #     def inspect
# # #         "inspect"
# # #     end

# # #     def to_s
# # #         "to-s"
# # #     end

# # #     def to_str
# # #         "to_str"
# # #     end
# # # end

# # # p C.new("")
# # # p "#{C.new("")}"
# # # p "" + C.new("")


# # # require 'json'

# # # json = <<-DATA
# # # ["red","green","blue"]
# # # DATA

# # # p JSON.parse(json)
# # # p JSON.dump(json)

# # # x,y = [0,1,2]
# # # x,*y = 1,2,3,4,5

# # # p x
# # # # p y

# # # def bar(a:,b: 100, **z)
# # #     p z
# # #     a + b
# # # end

# # # bar(a: 2, c: 100, d: 200)


# # print "a\nb"

# # p "aaa".object_id
# # p "aaa".object_id
# # p :aaa.object_id
# # p :aaa.object_id

# # a = [0,1,1,2,3]
# # a[0,2] = 10
# # p a

# # a,b = [1,2]

# # p a
# # p b

# # a,*b = 1,2,3
# # p a
# # p b

# # f = Fiber.new{
# #     puts "hoge"
# #     }
    
# # p "foo"
# # p f.resume
# # p "bar"

# def m
#     begin
#         puts "begin"
#         1
#     ensure
#         puts "ensure"
#         2
#     end
# end

# p m()

# def hoge(a,*b)
#     p a
#     # p b
# end

# hoge([1,2,3,4])


# class C

#     @@val = 100

#     def m
#         @@val = 200
#     end

#     def output
#         p @@val
#     end


# end

# C.new.output


# a,b,c = [1,2]

# p a
# p b
# p c


# class C

#     def sort(v,y)
#         p v < y
#     end

# end




# C.new.sort(1,2)


# class Module
#     def const_missing(id)
#       puts "Module#const_missing()"
#       id = 1
#     end
#   end
  
#   class Class
#     def const_missing(id)
#       puts "Class#const_missing()"
#       id = 2
#     end
#   end
  
#   class Object
#     def const_missing(id)
#       puts "Object#const_missing()"
#       id = 3
#     end
#   end
  
#   class A
#     def const_missing(id)
#       puts "A#const_missing()"
#       id = 4
#     end
#   end
  
#   class B < A
#     CNST_X = "123"
      
#     def method01
#       puts "CNST_X=#{CNST_X}"
#       puts "CNST_Y=#{CNST_Y}"
#     end
  
#     def const_missing(id)
#       puts "B#const_missing()"
#       id = 5
#     end
#   end 
  
#   obj = B.new
#   obj.method01


module M
    @@xx = 100
    @x = 100
end


class C
    @@xx = 222
    @x = 200
    include M
end


class C
    puts @@xx
    puts @x
end

module M
    puts @@xx
    puts @x
end

# class D < C
#     @@xx = 3000
# end

# class D
#     puts @@xx
# end

# class C
#     puts @@xx
#     puts @c
# end

# module M
#     puts @@xx
# end