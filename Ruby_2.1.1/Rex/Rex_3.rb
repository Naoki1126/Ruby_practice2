# module M
#     CONST = "Hello, world"
#   end
  
#   class M::C
#     def awesome_method
#       CONST
#     end
#   end
  
#   p M::C.new.awesome_method

#   class C
#   end
  
#   module M
#     CONST = "Hello, world"
  
#     C.class_eval do
#       def awesome_method
#         CONST
#       end
#     end
#     C.instance_eval do
#         def get_const
#             CONST
#         end
#     end
#   end
  
#   p C.new.awesome_method
#   p C.get_const

  class C
    CONST = "Hello, world"
  end
  
  module M
    CONST = "Good,Night"
    C.class_eval(<<-CODE)
      def awesome_method
        CONST
      end
    CODE
    
    C.class_eval do
        def get_const
            CONST
        end
    end

    C.instance_eval(<<-CODE)
        def getted_const
            CONST
        end
    CODE

    C.instance_eval do
        def getted_c_const
            CONST
        end
    end
  end
  
  p C.new.awesome_method
  p C.new.get_const
  p C.getted_const
  p C.getted_c_const

  # class C
  #   CONST = "Hello, world"
  # end
  
  # module M
  #   C.class_eval do
  #     def awesome_method
  #       CONST
  #     end
  #   end
  # end
  
  # p C.new.awesome_method