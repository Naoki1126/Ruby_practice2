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
  
  p C.new.awesome_method #=> Hello,world class_evalに文字列を用いた場合、モジュールのネストは外れる #class_evalはインスタンスメソッド
  p C.new.get_const #=> Good Night Class_eval にdoを用いた場合ばレキシカルスコープを参照する
  p C.getted_const #=> instance_evalはクラスメソッドの追加、レキシカルスコープを探索する。
  p C.getted_c_const #=> doであってもレキシカルスコープを参照する

  test = C.new
  test.instance_eval do
    def test
      p "ait"
    end
  end

  test.test

  test.instance_eval(<<-CODE)
    def taro
      puts "taro"
    end
  CODE

  test.taro

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

  # begin
  #   print "liberty" + :fish.to_s
  # rescue TypeError
  #   print "TypeError."
  # rescue
  #   print "Error."
  # else
  #   print "Else." #=>エラーが起きなかった場合の処理
  # ensure
  #   print "Ensure." #=>エラーがあってもなくてもやる処理
  # end

  # #=> Else Ensure

  # class String
  #   alias hoge reverse
  # end
  
  # p "12345".hoge

  # class Class
  #   def method_missing(id, *args)
  #     puts "Class#method_missing"
  #   end
  # end
  # class A
  #   def method_missing(id, *args)
  #     puts "A#method_missing"
  #   end
  # end
  # class B < A
  #   def method_missing(id, *args)
  #     puts "B#method_missing"
  #   end
  # end
  
  # B.new.dummy_method #=> 定義されていないメソッド呼び出しに対しmethod_missingが呼ばれる #B#method_missing
  # B.dummy_method #=> クラスメソッドのため Class#method_missing

  # class Human
  #   NAME = "Unknown"
  
  #   def name
  #     NAME
  #   end
  # end
  
  # class Noguchi < Human
  #   NAME = "Hideyo"
  # end
  
  # puts Noguchi.new.name #=>定数の参照はレキシカルスコープ