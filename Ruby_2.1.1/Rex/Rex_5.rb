# module M1
# end

# module M2
# end

# class C
#   include M1, M2
# end

# p C.ancestors

# module M
#     CONST = "Hello, world"
#   end
  
#   M.instance_eval(<<-CODE)
#     CONST = "HEllo eval"
#     def say
#       CONST
#     end
#   CODE
  
#   p M::say

#   module M
#     CONST = "Hello, world"
#   end
  
#   class << M
#     CONST ="hello"
#     def say
#       CONST
#     end
#   end
  
#   p M::say

# module M
#     CONST = "Hello, world"
#   end
  
# #   M.module_eval(<<-CODE)
# #     def self.say
# #       CONST
# #     end
# #   CODE
  



#   M.module_eval do
#   def self.say
#     CONST
#   end

# end

# p M::say

class String
    alias :hoge :reverse
  end
  
  p "12345".hoge


p [1,2,3,4,5].inject{ |sum,x| sum + x }