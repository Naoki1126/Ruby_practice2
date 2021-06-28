# # # class MyClass
# # #     def my_method(my_arg)
# # #         my_arg * 2
# # #     end
# # # end


# # # obj = MyClass.new()
# # # p obj.my_method(2)

# # # obj.send(:my_method,2)

# # class MyClass
# #     private
# #     def my_private_method
# #         puts "private method"
# #     end

# # end


# # obj = MyClass.new()

# # begin
# #     obj.my_private_method
# # rescue NameError => ex
# #     puts ex.class
# # end

# # obj.send(:my_private_method)

# class MyClass
#     define_method :my_method do |my_arg|
#         my_arg * 3
#     end
# end

# obj = MyClass.new
# p obj.my_method(3)