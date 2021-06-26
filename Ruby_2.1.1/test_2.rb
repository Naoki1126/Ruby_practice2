# module M
#     def method_missing(id, *arg)
#       puts "M#method_missing()"
#     end
#   end
  
#   class A
#     include M
#     # A.メソッド 時にメソッドが定義されていな場合は以下が呼び出される
#     def method_missing(id, *arg)
#       puts "A#method_missing()"
#     end
#   end
  
#   class B < A
#     # Aのインスタンスメソッドが継承される
#     # Bにクラスメソッドを定義する
#     class << self
#       def method_missing(id, *arg)
#         puts "B#method_missing()"
#       end
#     end
#   end
  
#   obj = B.new
#   # メソッド探索：Bにはインスタンスメソッドがないので、Aのインスタンスメソッドを読み込む
#   obj.x #=> A#method_missing()

#   class C
#     def m1
#       def m2
#       end

#     end

#   end


#   class D < C
#   end


#   obj = D.new

#   p C.instance_methods(false)

module Mod

  class Parent
    @@var = 1

    class << self
      @@var = 3
    end

    def output
      p @@var
    end

    def initialize
      @@var = 10
    end

  end


  class Child < Parent
    # @@var = 4

    def output
      p @@var
    end

    def initialize
      @@var = 22
    end

  end

  # if Child < Prarent
  #   @@var = 22
  # end
end


# child = Mod::Child.new

# ins = Mod::Parent.new
# ins.output

# # child = Mod::Child.new
# child.output

class ConstParent
  CONST = 111111

  def self.get_const
    const_get(:CONST,false)
  end

  def self.get_const2
    CONST
  end

end


class ConstChild < ConstParent
  CONST = 222222
  def output
    CONST
  end
end


# con = ConstParent.new
# conchild = ConstChild.new
# p conchild.output

p ConstChild.get_const
p ConstChild.get_const2