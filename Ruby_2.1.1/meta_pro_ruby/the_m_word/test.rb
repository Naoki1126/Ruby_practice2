# # # class C
# # #     def m
# # #         puts m
# # #     end

# # #     CONST = 1111111
# # # end


# # # c = C.new
# # # c.instance_eval do
# # #     def f
# # #         puts "f"
# # #     end
# # # end

# # # C.class_eval do
# # #     CONST = 2222
# # #     def get_const
# # #         p CONST
# # #     end
# # # end


# # # C.new.get_const

# # # c.f


# # class MyClass
# #     @my_var = 1

# #     def self.read
# #         @my_var
# #     end

# #     def write
# #         @my_var = 2
# #     end

# #     def read
# #         @my_var
# #     end
# # end

# # obj = MyClass.new
# # p obj.read
# # p obj.write
# # p obj.read
# # p MyClass.read


# # class Loan
# #     def initialize(book)
# #         @book = book
# #         @time = Time.now
# #     end

# #     def to_s
# #         "#{@book.upcase} loaned on #{@time}"
# #     end
# # end

# # class Loan
# #     def initialize(book)
# #         @book = book
# #         @time = Loan.time_class.now
# #     end

# #     def self.time_class
# #         @time_class || Time
# #     end

# # end

# # class MyClass < String
# #     def my_method
# #         "hello"
# #     end
# # end

# c = Class.new(String) do
#     def my_method
#         "Hello"
#     end
# end

# MyClass = c


# class Paragraph

#     def initialize(text)
#         @text = text
#     end

#     def title?
#         @text.upcase == @text
#     end

#     def reverse
#         @text.reverse
#     end

#     def upcase
#         @text.upcase
#     end
# end


str = "Just a regular string"

def str.title?
    self.upcase == self
end

p str.title?
p str.methods.grep(/title?/)
p str.singleton_methods


str.define_singleton_method

    def check
        self.upcase == str
    end
end

str.check