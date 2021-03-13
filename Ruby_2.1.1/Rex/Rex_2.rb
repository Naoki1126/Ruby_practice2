# class Base
#   def name
#     p 'Base#name'
#   end
# end

#   module Scope
#     class Base
#       def name
#         p 'Scope::Base#name'
#       end
#     end

#     class Inherited < Base # クラスScope::Baseとして解釈される
#       def name
#         p 'Scope::Inherited#name'
#         super
#       end
#     end
#   end

# inherited = Scope::Inherited.new
# inherited.name


# class C
#   @val = 3 #=> クラスインスタンス変数 # 特異メソッドからアクセスすることができる。
#   attr_accessor :val
#   class << self
#     @val = 10
#   end
#   def initialize
#     @val *= 2 if val
#   end
# end

# c = C.new
# c.val += 10

# p c.val #=> nil

# module M
#   CONST = "Hello, world"
# end

# class M::C
#   def awesome_method
#     CONST
#   end
# end

# p M::C.new.awesome_method　#例外が発生

class C
end

module M
  CONST = "Hello, world"

  C.class_eval do
    def awesome_method
      CONST
    end
  end
end

p C.new.awesome_method