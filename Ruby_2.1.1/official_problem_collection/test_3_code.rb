# # # # # # # # # # # # require "date"

# # # # # # # # # # # # # t = Time.now + 1
# # # # # # # # # # # # # p t >> 1

# # # # # # # # # # # # d = Date.today
# # # # # # # # # # # # p d >> 1

# # # # # # # # # # # # d = DateTime.now
# # # # # # # # # # # # p d >> 1


# # # # # # # # # # # # Child.new.rem_method
# # # # # # # # # # # # Child.new.und_method

# # # # # # # # # # # # add = Proc.new { |x,y| puts x + y}

# # # # # # # # # # # # add.call(1,2)
# # # # # # # # # # # # add(1,3).call

# # # # # # # # # # # 



# # # # # # # # # # class Parent
# # # # # # # # # #     def rem_method
# # # # # # # # # #         puts "Hello rem_method"
# # # # # # # # # #     end


# # # # # # # # # #     def und_method
# # # # # # # # # #         puts "Hello und_method"
# # # # # # # # # #     end

# # # # # # # # # # end


# # # # # # # # # # class Child < Parent

# # # # # # # # # #     def rem_method
# # # # # # # # # #         puts "child rem_method"
# # # # # # # # # #     end


# # # # # # # # # #     def und_method
# # # # # # # # # #         puts "child und_method"
# # # # # # # # # #     end

# # # # # # # # # #     undef und_method, rem_method
# # # # # # # # # # end

# # # # # # # # # # Parent.new.rem_method



# # # # # # # # # # class A
# # # # # # # # # #     val = 0

# # # # # # # # # #     def output
# # # # # # # # # #         val = 9
# # # # # # # # # #         p val
# # # # # # # # # #     end
# # # # # # # # # # end

# # # # # # # # # # A.new.output


# # # # # # # # # module M
# # # # # # # # #     def self.append_features(include_class_name)
# # # # # # # # #         puts "append_features"
# # # # # # # # #         super
# # # # # # # # #     end

# # # # # # # # #     def func
# # # # # # # # #         p "Hello"
# # # # # # # # #     end

# # # # # # # # #     def greet
# # # # # # # # #         p "Hello world"
# # # # # # # # #     end
# # # # # # # # # end

# # # # # # # # # class C
# # # # # # # # #     include M
# # # # # # # # # end

# # # # # # # # # # C.new.func
# # # # # # # # # C.new.greet
# # # # # # # # # C.new.greet

# # # # # # # # class C
# # # # # # # #     def initialize(str)
# # # # # # # #         @str = str
# # # # # # # #     end

# # # # # # # #     def inspect
# # # # # # # #         "inspect"
# # # # # # # #     end

# # # # # # # #     def to_s
# # # # # # # #         "to-s"
# # # # # # # #     end

# # # # # # # #     def to_str
# # # # # # # #         "to_str"
# # # # # # # #     end
# # # # # # # # end

# # # # # # # # p C.new("")
# # # # # # # # p "#{C.new("")}"
# # # # # # # # p "" + C.new("")


# # # # # # # # require 'json'

# # # # # # # # json = <<-DATA
# # # # # # # # ["red","green","blue"]
# # # # # # # # DATA

# # # # # # # # p JSON.parse(json)
# # # # # # # # p JSON.dump(json)

# # # # # # # # x,y = [0,1,2]
# # # # # # # # x,*y = 1,2,3,4,5

# # # # # # # # p x
# # # # # # # # # p y

# # # # # # # # def bar(a:,b: 100, **z)
# # # # # # # #     p z
# # # # # # # #     a + b
# # # # # # # # end

# # # # # # # # bar(a: 2, c: 100, d: 200)


# # # # # # # print "a\nb"

# # # # # # # p "aaa".object_id
# # # # # # # p "aaa".object_id
# # # # # # # p :aaa.object_id
# # # # # # # p :aaa.object_id

# # # # # # # a = [0,1,1,2,3]
# # # # # # # a[0,2] = 10
# # # # # # # p a

# # # # # # # a,b = [1,2]

# # # # # # # p a
# # # # # # # p b

# # # # # # # a,*b = 1,2,3
# # # # # # # p a
# # # # # # # p b

# # # # # # # f = Fiber.new{
# # # # # # #     puts "hoge"
# # # # # # #     }
    
# # # # # # # p "foo"
# # # # # # # p f.resume
# # # # # # # p "bar"

# # # # # # def m
# # # # # #     begin
# # # # # #         puts "begin"
# # # # # #         1
# # # # # #     ensure
# # # # # #         puts "ensure"
# # # # # #         2
# # # # # #     end
# # # # # # end

# # # # # # p m()

# # # # # # def hoge(a,*b)
# # # # # #     p a
# # # # # #     # p b
# # # # # # end

# # # # # # hoge([1,2,3,4])


# # # # # # class C

# # # # # #     @@val = 100

# # # # # #     def m
# # # # # #         @@val = 200
# # # # # #     end

# # # # # #     def output
# # # # # #         p @@val
# # # # # #     end


# # # # # # end

# # # # # # C.new.output


# # # # # # a,b,c = [1,2]

# # # # # # p a
# # # # # # p b
# # # # # # p c


# # # # # # class C

# # # # # #     def sort(v,y)
# # # # # #         p v < y
# # # # # #     end

# # # # # # end




# # # # # # C.new.sort(1,2)


# # # # # # class Module
# # # # # #     def const_missing(id)
# # # # # #       puts "Module#const_missing()"
# # # # # #       id = 1
# # # # # #     end
# # # # # #   end
  
# # # # # #   class Class
# # # # # #     def const_missing(id)
# # # # # #       puts "Class#const_missing()"
# # # # # #       id = 2
# # # # # #     end
# # # # # #   end
  
# # # # # #   class Object
# # # # # #     def const_missing(id)
# # # # # #       puts "Object#const_missing()"
# # # # # #       id = 3
# # # # # #     end
# # # # # #   end
  
# # # # # #   class A
# # # # # #     def const_missing(id)
# # # # # #       puts "A#const_missing()"
# # # # # #       id = 4
# # # # # #     end
# # # # # #   end
  
# # # # # #   class B < A
# # # # # #     CNST_X = "123"
      
# # # # # #     def method01
# # # # # #       puts "CNST_X=#{CNST_X}"
# # # # # #       puts "CNST_Y=#{CNST_Y}"
# # # # # #     end
  
# # # # # #     def const_missing(id)
# # # # # #       puts "B#const_missing()"
# # # # # #       id = 5
# # # # # #     end
# # # # # #   end 
  
# # # # # #   obj = B.new
# # # # # #   obj.method01


# # # # # module M
# # # # #     @@xx = 100
# # # # #     @x = 100
# # # # # end


# # # # # class C
# # # # #     @@xx = 222
# # # # #     @x = 200
# # # # #     include M
# # # # # end


# # # # # class C
# # # # #     puts @@xx
# # # # #     puts @x
# # # # # end

# # # # # module M
# # # # #     puts @@xx
# # # # #     puts @x
# # # # # end

# # # # # # class D < C
# # # # # #     @@xx = 3000
# # # # # # end

# # # # # # class D
# # # # # #     puts @@xx
# # # # # # end

# # # # # # class C
# # # # # #     puts @@xx
# # # # # #     puts @c
# # # # # # end

# # # # # # module M
# # # # # #     puts @@xx
# # # # # # end

# # # # # class C
# # # # #     def method_missing(name)
# # # # #         puts "メソッド#{name}は存在しませんよ"
# # # # #     end

# # # # #     def self.method_missing(name)
# # # # #         puts "メソッド#{name}は存在しません"
# # # # #     end
# # # # # end

# # # # # C.new.aaaa
# # # # # C.tnakan


# # # # class Err2 < StandardError
# # # # end

# # # # class Err1 < Err2
# # # # end

# # # # begin
# # # #     raise 
# # # # rescue Err1 => ex
# # # #     puts ex.class
# # # #     puts "Err1"
# # # # rescue Err2 => ex
# # # #     puts ex.class

# # # # rescue StandardError => ex
# # # #     puts "StandardError"
# # # #     puts ex.class
# # # # end



# # # # class A
# # # #     @@x = 0

# # # #     class << self
# # # #         @@x = 1
# # # #         def x
# # # #             @@x = 2
# # # #         end

# # # #         def output
# # # #             p @@x
# # # #         end
# # # #     end
# # # # end


# # # # class B < A

# # # #     @@x = 4
# # # # end

# # # # B.output
# # # # B.x
# # # # B.output


# # # # module Top
# # # #     CONST = 23

# # # # end


# # # # module Mod
# # # #     extend Top
# # # #     # CONST = 200
# # # # end

# # # # # class R
# # # # #     include Mod
# # # # #     def output
# # # # #         p CONST
# # # # #     end
# # # # # end

# # # # # R.new.output


# # # # # def proc_test
# # # # #     pr = lambda{ break 1 }
# # # # #     pr.call
# # # # #     p "aaaa"
# # # # # end

# # # # # proc_test





# # # # class C
# # # #     # CONST = 100

# # # #     class << self
# # # #         CONST = 50
# # # #     end

# # # #     def self.const_get
# # # #         p CONST
# # # #     end
# # # # end


# # # # class D < C

# # # #     class << self
# # # #         def const_get
# # # #             p CONST
# # # #         end
# # # #     end

# # # #     def const_get
# # # #         p CONST
# # # #     end
# # # # end

# # # # # D.const_get
# # # # # # D.new.const_get
# # # # # C.const_get

# # # # def aaa
# # # # a, b =
# # # #     for x in 1..10
# # # #       for y in 1..10
# # # #         return [x, y] if x + y == 10
# # # #       end
# # # #     end
# # # # end

# # # # aaa

# # # module M
# # #     CONST =100
# # # end

# # # class C
# # #     prepend M
# # #     def output
# # #         p CONST
# # #     end
# # # end

# # # C.new.output


# # # class C

# # module M
# #     CONST =100
# #     @@val = 190
# # end


# # class C
    
# # end


# # class D < C
# #     extend M
# #         # p @@val
# #         # p CONST

# #         p self.ancestors
# # end


# # # D.new.output
# # def proc_exit
# #     begin
# #       exit
# #     # rescue SystemExit
# #     #   puts "processing_exit"
# #     # ensure
# #     #   puts "確保する"
# #     end

# #     puts "exit"
# #   end


# # p (1.0 + "(1/2r)".to_r).to_r


# require 'yaml'

# yaml_data = <<-DATA

# - red
# - green
# - blue
# ---
# - yellow
# - pink
# - white
# DATA

# p YAML.load(yaml_data)
# # p YAML.read(yaml_data)
# p (1..Float::INFINITY).lazy.map {|i| i**2 }.take(3).inject(0) {|sum,i| sum += i }


require "date"

d = DateTime.new
p d
p d + 1

d = Date.new
p d >> 1

array = [1,2,3].freeze
array += [4,5]
p array

class C
    def self.anc
        p self.ancestors
    end

end

C.anc