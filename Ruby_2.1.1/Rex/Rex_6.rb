# # # # while not DATA.eof?
# # # #     lines = DATA.readlines
# # # #     lines.reverse
# # # #     p lines
# # # #   end
  
# # # #   __END__
# # # #   1
# # # #   2
# # # #   3
# # # #   4

# # # class C
# # #     @val = 3
# # #     attr_accessor :val
# # #     class << self
# # #         @val = 10
# # #     end

# # #     def initialize(val)
# # #         @val = val
# # #     end
# # # end

# # # c = C.new(10)
# # # c.val += 10

# # # p c.val


# # class D
# #     CONST =12
# # end

# # class F < D
# #     def output
# #         p CONST
# #     end
# # end

# # f = F.new
# # f.output


# # module M
# #     # CONST = 1
# #     def output
# #         p CONST
# #     end
# # end


# # class G
# #     CONST =120
# # end

# # class T < G
# #     include M
# #     def output
# #         p CONST
# #     end
# # end

# # t = T.new

# # t.output

# class OriginalError < StandardError
# end


# begin
#     raise OriginalError.new
# rescue StandardError => ex
#     p ex.class
# end


# begin
#     raise NoMethodError
# rescue NameError =>ex
#     p ex.class
# end


# # var1 = [1,2,3,].freeze
# # var1 << 4

# a = "hoge"

# p a.object_id

# def a.output
#     puts "aaaaa"
# end

# a.output

# b = a.dup

# p b.object_id

# # b.output


# c = a.clone
# p c.object_id
# c.output

# # module M
# #     def refer_const
# #       CONST
# #     end
# # end
  
# #   module E
# #     CONST = '010'
# #   end
  
# #   class D
# #     CONST = "001"
# #   end
  
# #   class C < D
# #     include E
# #     include M
# #     CONST = '100'
# #   end
  
# #   c = C.new
# #   p c.refer_const

class D
    def func; puts"D hello";end
end

class C < D
    def func; puts "Hello";end
end


class C
    remove_method :func
end

puts C.new.func