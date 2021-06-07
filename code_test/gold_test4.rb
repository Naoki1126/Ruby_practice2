# module M
#     CONST = "Hello, world"
#   end

#   module M
#     def self.say
#       CONST
#     end
#   end

#   p M::say
#   p M.say


#   module M
#     CONST = "Hello, world"
#   end

#   M.instance_eval(<<-CODE)
#     def say
#       CONST
#     end
#   CODE

#   p M::say

