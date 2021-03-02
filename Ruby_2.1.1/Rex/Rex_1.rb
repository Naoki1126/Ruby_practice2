# module M
#     def class_m
#         "class_m"
#     end
# end

# class C
#     include M
#     def self.test
#         "test"
#     end
# end

# p C.methods.include? :class_m #=> false
# p C.methods.include? :test #=> true
# #include Moduleのインスタンスメソッドをミックスインする
# c.methodは　特異メソッドを表示する

# class C
#     def initialize
#       p self.class
#     end
#   end
#   class C2 < C
#   end
  
#  a = C2.new
#  p a #=> C2

#  class C
#     class << C
#       def hoge
#         'Hi'
#       end
#     end
  
#     def hoge
#       'Goodbye'
#     end
#   end
  
#   p C.new.hoge #=> goobye (インスタンスメソッド)
#   p C.hoge #=> Hi クラスメソッド（特異メソッド）


# # 5
#   class S
#     @@val = 0
#     def initialize
#       @@val += 1
#     end
#   end
  
#   class C < S
#     class << C
#       @@val += 1
#     end
  
#     def initialize
#     end
#   end
  
#  # class << C end;の処理は定義の段階で実行される
#   C.new #=> オーバーライドにより、@@val += 1 は実行されない
#   p C.class_variable_get(:@@val) #=> 1
#   C.new #=> オーバーライドにより、@@val += 1 は実行されない
#   p C.class_variable_get(:@@val) #=> 1
#   S.new
#   p C.class_variable_get(:@@val) #=> 2
#   S.new
#   p C.class_variable_get(:@@val) #=> 3
#   p C.class_variable_get(:@@val) #=> 3

# class Object
#     CONST = "100"
# end

# class C
#     CONST = "010"
#     class << self
#         CONST = "001"

#         def constants
#             CONST
#         end
#     end
# end

# p C::CONST #=> 010
# p Object::CONST #=> 100

# p C.constants #=> 001

# def hoge(*args, &block)
#     block.call(*args)
#   end
  
#   hoge(1,2,3,4) do |*args|
#     p args.length > 0 ? "hello" : args
#   end

#   def m1(*)
#     str = yield if block_given?
#     p "m1 #{str}"
#   end
  
#   def m2(*)
#     str = yield if block_given?
#     p "m2 #{str}"
#   end
  
#   m1 m2 do
#     "hello"
#   end

# "m2 "
# "m1 hello"


# class C
#     def m1
#       200
#     end
#   end
  
#   module R
#     refine C do
#       def m1
#         100
#       end
#     end
#   end

#   class C
#     using R

#     def price
#         puts m1
#     end
#   end
#   c = C.new                
#   puts c.m1 #=> 200
#   puts c.price

# module M
#     def method_missing(id, *args)
#         puts "M#method_missing"
#     end
# end
# class A
#     include M
#     def method_missing(id, *args)
#         puts "A#method_missing"
#     end
# end
# class B < A
#     class << self
#         def method_missing(id, *args)
#         puts "B.method_missing"
#         end
#     end
# end

# #method_missingは最後に呼び出されるメソッド
# B.new.dummy_method #=> A#method_missing インスタンスメソッドの呼び出し
# B.dummy_method #=> B.method_missing 特異メソッドの呼び出し


# class C
#     def self.m1
#       200
#     end
#   end
  
#   module R
#     refine C do
#       def self.m1
#         100
#       end
#     end
#   end

#   using R
#   puts C.m1 #=> 200

# class C
#     def self.m1
#         'C.m1'
#     end

#     def self.m3
#         'C.m3'
#     end
# end

# module M
#     refine C.singleton_class do
#         def m1
#         'C.m1 in M'
#         end

#         def m2
#         'C.m2 in M'
#         end

#         def m3
#             'C.m3 in M'
#         end
#     end
# end

# using M
  
# puts C.m1 # C.mi in M
# puts C.m2
# puts C.m3

# #クラスメソッドを再定義するためにはsingleton_classを使用。selfは無名モジュールを指す

# class Human
#     NAME = "Unknown"

#     def self.name
#       const_get(:NAME)
#     end
#   end
#   class Fukuzawa < Human
#     NAME = "Yukichi"
#   end
  

#   class MARUYAMA < Human
#   end
#   puts Fukuzawa.name #=> Yukichi

#   puts Human.name #=> Unknown

#   puts MARUYAMA.name #=> Unknown

  #const_get引数の定数をself から探索する。自クラスに定義がない場合はメソッド同様探索を行う


# class C
#   public
#     def initialize
#     end
#   end
  
#   p C.new.private_methods.include? :initialize
#   p C.private_methods
#   p C.new.private_methods == C.private_methods #=> false クラスメソッドとインスタンスメソッドはやはり違う

#=> initializeはprivateメソッド


# class S
#   @@val = 0
#   def initialize
#     @@val += 1
#   end
# end

# class C < S
#   class << C
#     @@val += 1
#   end

#   def initialize
#     @@val += 1
#     super
#   end
# end

# C.new
# p C.class_variable_get(:@@val)　#=> 3 特異メソッド・C.intialize・superのS.initialize
# C.new
# p C.class_variable_get(:@@val) #=> 5 C.initialize and S.initialize
# S.new
# p C.class_variable_get(:@@val) #=> 6 S.iniitialize
# S.new
# p C.class_variable_get(:@@val) #=> 7 S.initialize


# def hoge(*args, &block)
#   block.call(*args)
# end

# hoge(1,2,3,4) do |*args|
#   p args.length > 0 ? "hello" : args
# end
 
# #=> hello


# class C
#   def m1(value)
#     100 + value
#   end
# end

# module R1
#   refine C do
#     def m1
#       super 50
#     end
#   end
# end

# module R2
#   refine C do
#     def m1
#       super 100
#     end
#   end
# end

# using R1
# using R2

# #有効になる再定義は一つだけ
# #R2が有効になる
# #super にて親クラスのメソッドに引数　100を渡している
# puts C.new.m1 #=> 200


# class String
#   # alias_method :hoge, :reverse
#   alias_method "hoge","reverse"
#   #alias_methodの引数はシンボルかストリング
#   # aliasの引数はシンボル
#   # alias :新メソッド名,:既存メソッド名
#   #　既存メソッドも使用できる。
# end

# p "12345".hoge
# p "321".reverse


# class C
#   def m1
#     200
#   end
# end

# module R
#   refine C do
#     def m1
#       300
#     end
#   end
# end

# using R

# class C
#   def m1
#     100
#   end
# end

# puts C.new.m1　#=> 300

# #メソッド探索
# refinement > prependしたモジュール >  Class C > includeしたモジュール　> クラスCのsuperClass


# def foo(arg1:100, arg2:200)
#   puts arg1
#   puts arg2
# end

# option = {arg2: 900}

# foo arg1: 200, **option #=>キーワード引数にHashを渡すときは変数の前に*＊をつける。

#=> 200
#-> 900


# class Base
#   CONST = "Hello, world"
# end

# class C < Base
# end

# module P
#   CONST = "Good, night"
# end

# class Base
#   prepend P
# end

# module M
#   class C
#     CONST = "Good, evening"
#   end
# end

# module M
#   class ::C　#=> ::Cはトップレベルにあるものを指す
#     def greet
#       CONST
#     end
#   end
# end

# c = C.new
# p c.class
# p C.ancestors

# class Object
#   CONST = "1"
#   def const_succ
#     CONST.succ! #=> objectの内容を次に進める
#   end
# end

# class Child1
#   const_succ #2になる
#   class << self
#     const_succ #3になる
#   end
# end

# class Child2
#   const_succ  #4になる
#   def initialize
#     const_succ #5になる
#   end
# end

#定義された段階で、定数の内容が破壊的に変更されている
# Child1.new
# p Object::CONST #=> 4
# Child1.new
# p Object::CONST #=> 4
# Child2.new 
# p Object::CONST #=> 5

# Child2.new 
# p Object::CONST #=> 6

# p Child1.const_succ #=> 7


# class S
#   def initialize
#     puts "S#initialize"
#   end
# end

# class C < S
#   def initialize(*args)
#     super() #=> 引数ありのメソッド内で引数なしのメソッドを呼ぶ場合は明示的に（）を付ける必要がある。
#     puts "C#initialize"
#   end
# end

# C.new(1,2,3,4,5)


# p "Matz is my tEacher"[/[J-P]\w+[^ ]/] #=> Matz
#[J-P] JからPの一文字に一致
# \w 大文字、小文字、数字、アンダーバーにマッチ
# + 直前の文字の一回以上の繰り返し
# [^ ]空白以外

# val = 100

# def method(val)
#   yield(15 + val)
# end

# _proc = Proc.new{|arg| val + arg }

# p method(val, &_proc) #=> 215
# p method(val, &_proc.to_proc) #=> 215


# enum = "apple".each_char
# enum = "apple".to_enum(:each_char)
# enum = "a p p l e".split(' ').to_enum #=> to_enumはeachなのでレシーバは配列でなければならない
# enum = "apple".enum_for(:each_char)
# enum = "a p p l e".split(' ').enum_for #=> enum_forに引数を与えないとto_enumと同じ挙動になる
# #=> each_char　文字列の各文字に対して繰り返し処理を行う

# p enum.next #=> a
# p enum.next #=> p
# p enum.next #=> p
# p enum.next #=> l
# p enum.next #=> e


# m = Module.new

# m.instance_eval do
#  p m.instance_variable_set :@block, Module.nesting
# end

# m.instance_eval(<<-EVAL)
#   m.instance_variable_set :@eval,  Module.nesting
# EVAL

# block = m.instance_variable_get :@block
# puts block
# _eval =  m.instance_variable_get :@eval
# puts _eval

# puts block.size
# puts _eval.size


# module M
#   def foo
#     super
#     puts "M#foo"
#   end
# end

# class C2
#   def foo
#     puts "C2#foo"
#   end
# end

# class C < C2
#   def foo
#     super
#     puts "C#foo"
#   end
#   include M
# end

# C.new.foo

# # C2#foo
# M#foo
# C#foo

# v1 = 1 / 2 == 0 #=>  true
# v2 = !!v1 or raise RuntimeError #=> viのtrueにて評価が終わりtrueが入る
# puts v2 and false　#=> and　左辺が真であれば右辺の結果を返す。左辺が偽であれば左辺を返す
# #　and は優先順位がputsより低いため trueが返される。


# class C
#   class << self
#     def hoge
#       'Hi'
#     end
#   end
#   def self.hoge
#     'Hi'
#   end
#   def hoge
#     'Goodbye'
#   end
# end



# class C
#   class << C
#     def hoge
#       'Hi'
#     end
#   end

#   def self.hoge #=> 普通にオーバーライドされる
#     'hiHi'
#   end

#   def hoge
#     'Goodbye'
#   end
# end

# p C.hoge #=> Hi
# p C.new.hoge #=> Goodbye




# class IPAddr
#   include Enumerable

#   def initialize(ip_addr)
#     @ip_addr = ip_addr
#   end

#   def each
#     return enum_for unless block_given?

#     @ip_addr.split('.').each do |octet|
#       yield octet
#     end
#   end
# end

# addr = IPAddr.new("192.10.20.30")
# enum = addr.each

# p enum.next # 192と表示される
# p enum.next # 10と表示される
# p enum.next # 20と表示される
# p enum.next # 30と表示される


#=> to_enum or enum_for

# question ~30

# 10.times{|d| print d < 2...d > 5 ? "O" : "X" } #=> OOOOOOOXXX

# (1..10).each do |d|
#   if d < 2...d > 5
#     puts "O"
#   else
#    puts "X"
#   end
# end


#まずは式1が真を返すとtrue返す
#式2が真を返すかまではtrueを返す
#式が真を返すとtrueを返し初期状態に戻る

# question ~31

# def m1(*)
#   str = yield if block_given?
#   p "m1 #{str}"
# end

# def m2(*)
#   str = yield if block_given?
#   p "m2 #{str}"
# end

# m1 m2 {
#   "hello"
# }

#m1には引数としてmdが渡されるためブロックは実行されない
#m2がブロックを実行。{} の方が結合度が高いため、下記のような出力になる。

#=> "m2 hello"
#=> "m1 "


# class Company
#   attr_reader :id
#   attr_accessor :name
#   def initialize id, name
#     @id = id
#     @name = name
#   end
#   def to_s
#     "#{id}:#{name}"
#   end
#   def <=> other
#     other.id <=> self.id
#   end
# end

# companies = []
# companies << Company.new(2, 'Liberyfish')
# companies << Company.new(3, 'Freefish')
# companies << Company.new(1, 'Freedomfish')

# companies.sort

# companies.each do |e|
#   puts e
# end

#=> 3:Freefish
#=> 2:Liberyfish
#=> 1:Freedomfish

# val = 1 * 1i
# puts val.class #=> complex

#li complex class
#片方がcomplexであればcomplex class

# def bar(&block)
#   block.yield
# end

# bar do
#   puts "hello, world"
# end

# def bar(&block)
#   block.call
# end

# bar do
#   puts "hello, world"
# end


#########Error############
# def bar(&block, n)
#   block.call
# end

# bar(5) {
#   puts "hello, world"
# }

#＆のブロック引数は最後に記述する
############################

# def bar(n, &block)
#   block.call
# end

# bar(5) {
#   puts "hello, world"
# }

# module SuperMod
#   module BaseMod
#     p Module.nesting #=> [SuperMod::BaseMod, SuperMod] inner→outer
#   end
# end

# module SuperMod
#   p Module.nesting #=> [SuperMod]

#   module BaseMod
#     p Module.nesting #=> [SuperMod::BaseMod, SuperMod]

#     module BaseBaseMod
#       p Module.nesting #=> [SuperMod::BaseMod::BaseBaseMod, SuperMod::BaseMod, SuperMod]
#     end
#   end
# end


# while not DATA.eof?
#   print DATA.read
# end

# __END__
# 1
# 2
# 3
# 4


# class C
# end

# module M
#   refine C do
#     def m1(value)
#       puts 'moduleM'
#       super value - 100
#     end
#   end
# end

# class C
#   def m1(value)
#     puts 'ClassC'
#     value - 100
#   end
# end

# using M

# class K < C
#   def m1(value)
#     puts 'ClassK'
#     super value - 100
#   end
# end

# puts K.new.m1 400

# # ClassK
# # moduleM
# # ClassC
# # 100

# p "Matz is | my tEacher".scan(/[is|my]/).length
# #=> 5

#=>[]は囲まれた文字列一つ一つにマッチする
#=> |は正規表現でORのメタ文字だが、[]に囲まれているため、今回はscanの対象となる。


# class Company
#   attr_reader :id
#   attr_accessor :name
#   def initialize id, name
#     @id = id
#     @name = name
#   end
#   def to_s
#     "#{id}:#{name}"
#   end
#   def <=> other
#     self.id <=> other.id
#   end
# end

# companies = []
# companies << Company.new(2, 'Liberyfish')
# companies << Company.new(3, 'Freefish')
# companies << Company.new(1, 'Freedomfish')

# companies.sort! {|x,y|
#   y <=> x
# }

# companies.each do |e|
#   puts e
# end

#　先にselfが来れば昇順、逆なら降順

# begin
#   raise "Err!"
# rescue => e
#   puts e.class #=> RuntimeError
#   puts e.class.superclass #=> StandardError
# end

# module K
#   CONST = "Good, night"
#   class P
    
#   end
# end

# module K::P::M
#   class C
#     CONST = "Good, evening"
#   end
# end

# module M
#   class C
#     CONST = "Hello, world"
#   end
# end

# class K::P
#   class M::C
#     p CONST
#   end
# end

#=> Good, evening

# class S
#   def initialize
#     puts "S#initialize"
#   end
# end

# class C < S
#   def initialize(*args)
#     super #=> argumentError
#     super() #=> 引数なしで呼び出せる
#     puts "C#initialize"
#   end
# end

# C.new(1,2,3,4,5)

# class C
#   CONST = "Good, night"
# end

# module M
#   CONST = "Good, evening"
# end

# module M
#   class C
#     CONST = "Hello, world"
#   end
# end

# module M
#   class ::C
#     p CONST #=> Good,night ::Cはトップレベルのクラス
#   end
# end

############ question ~45
