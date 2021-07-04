# # # class C
# # #     private
# # #     def output_c
# # #         puts "c"
# # #     end
# # #     public
# # #     def output_f
# # #         output_c
# # #     end
# # # end

# # # class D < C
# # #     def output_c
# # #         puts 'output'
# # #     end

# # #     def output_d
# # #         output_c
# # #     end

# # # end


# # # instance = D.new
# # # instance.output_f
# # # test_instance = C.new
# # # test_instance.output_f


# # # class User
# # #     attr_reader :name

# # #     def initialize(name, weight)
# # #         @name = name
# # #         @weight = weight
# # #     end

# # #     def heavier_then?(other_user)
# # #         other_user.weight < @weight
# # #     end

# # #     protected

# # #     def weight
# # #         @weight
# # #     end

# # # end

# # # alice = User.new("Ailce", 50)
# # # bob = User.new("BOb",60)

# # # p alice.heavier_then?(bob)
# # # p bob.heavier_then?(alice)

# # # alice.weight


# # class C
# #     @@a = 1


# # #     class << self
# # #         @@a = 3

# # #         def out_put_class_valiables
# # #             p @@a
# # #         end
# # #     end

# # #     def self.out_put
# # #         @@a = 5
# # #     end

# # #     def out_put_class_valiables
# # #         p @@a
# # #     end
# # # end

# # # class D < C
# # #     @@a = 2
# # #     def out_put
# # #         @@a = 1
# # #         p @@a
# # #     end
# # # end

# # # C.out_put_class_valiables
# # # C.new.out_put_class_valiables
# # # D.new.out_put

# # module MyModule
# #     def class_method; puts "OK"; end
# #   end
  
# #   module MyModule2
# #     def inst_method; puts "instance method OK"; end
# #   end
  
# #   class MyClass
# #     # クラスメソッド定義(特異クラスにインスタンスメソッドを定義)
# #     extend MyModule
    
# #     # インスタンスメソッド定義
# #     include MyModule2
# #   end
  
# #   class MyClass2 < MyClass
# #   end
  
# #   MyClass.class_method # => OK
# #   MyClass2.class_method # => OK 
# #   mc2 = MyClass2.new
# #   mc2.inst_method
# #   MyClass2.class_method


# #   module M
# #     def method; puts "module M"; super; end
# #   end

# #   class ParentClass
# #     def method; puts "class ParentClass"; end
# #   end

# #   class ChildClass < ParentClass
# #     include M
# #     def method; puts "class ChildClass"; super; end
# #   end

# #   ChildClass.new.method


# #   class ParentClass
# #     private
# #       def m; puts "OK"; end
# #   end

# #   class ChildClass < ParentClass
# #     def m
# #       super
# #     end

# #     def m2
# #       m
# #     end
# #   end

# #   childclass = ChildClass.new
# #   childclass.m # => OK
# #   childclass.m2 # => OK

#   class C
#     @v = 1
#     def m
#       @v = 2
#     end
#     class << C
#       @v = 3
#       # Cクラスのクラスメソッドを定義
#       def m
#         # Cクラスのクラスインスタンス変数を参照
#         @v
#       end
#     end
#   end
  
#   # クラスインスタンス変数
# #   クラスインスタンス変数はクラスメソッドから参照可能
#   p C.m
#   # => 1
  
#   # 生成オブジェクトのインスタンス変数
#   C.new.m
#   # => 2
  
#   # Cクラスの特異クラス内のインスタンス変数
#   class << C
#     @v
#   end
#   # => 3
  
#   # Cクラスの生成オブジェクトにおける特異クラス内のインスタンス変数(ややこしいw)
#   c = C.new
#   class << c
#     puts @v
#   end
#   # => nil
#   # 生成オブジェクト内でインスタンス変数未定義のため。当たり前か。





  # str = "RRRRstartbbbbbbbend....abbbbbc"

  # p str.index("start") 1
  # p str.index("end") 18



# class C

#   class << self

#     def test
#       puts "test"
#     end
#   end
# end




