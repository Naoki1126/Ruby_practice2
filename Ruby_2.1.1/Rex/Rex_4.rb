# class C
# end

# module M
#   CONST = "Hello, world"

#   C.class_eval do
#     def awesome_method
#       CONST
#     end


#   end
# end

# p C.new.awesome_method


# module M
#     CONST = "Hello, world"
# end

#   M.instance_eval(<<-CODE)
#     def say
#       CONST
#     end
#   CODE
  
#   p M::say

# module A
#     B = 42
  
#     def f
#       21
#     end
#   end
  
#   A.module_eval(<<-CODE)
#     def self.f
#       p B
#     end
#   CODE
  
#   B = 15
  
#   A.f

# class Array
#     def succ_each(step = 1)
#       return to_enum(:succ_each) unless block_given?
  
#       each do |int|
#         yield int + step
#       end
#     end
#   end
  
#   p [98, 99, 100].succ_each(2).map {|succ_chr| succ_chr.chr}
  
#   [101, 102, 103].succ_each(5) do |succ_chr|
#     p succ_chr.chr
#   end


# class Array
#     def succ_each(step = 1)
#       return to_enum(:succ_each, step) unless block_given?
  
#       each do |int|
#         yield int + step
#       end
#     end
#   end
  
#   p [98, 99, 100].succ_each(2).map {|succ_chr| succ_chr.chr}
  
#   [101, 102, 103].succ_each(5) do |succ_chr|
#     p succ_chr.chr
#   end


class Array
    def succ_each(step = 1)
      unless block_given?
        Enumerator.new do |yielder|
          each do |int|
            yielder << int + step
          end
        end
      else
        each do |int|
          yield int + step
        end
      end
    end
  end


  p [98, 99, 100].succ_each(2).map {|succ_chr| succ_chr.chr}

  [101, 102, 103].succ_each(5) do |succ_chr|
    p succ_chr.chr
  end


  class C
  end
  
  def C._singleton
    self
  end
  
  p C._singleton

  class C
  end
  
  class << C
    def _singleton
      self
    end
  end
  
  p C._singleton

  class C
  end
  p C.singleton_class


  class C
    def self._singleton
      class << C
        self
      end
    end
  end
  
  p C._singleton


  