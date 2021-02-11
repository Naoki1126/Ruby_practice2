module Loggable
    #省略
end

class Product
    include Loggable
end

Product.include?(Loggable) #=> true
#インクルードされているか判断することができる。

Product.included_modules #=> [Logable,Kernel]
#インクルードされているmoduleの一覧が取得できる

Product.ancestores #=> [Product,Loggable,Object, Kernel, BasicObject]
#モジュールだけでなく、スーパークラスの情報も取得できる。

product = Product.new
# product.classはProductクラスを返す
product.class.include?(Loggable) #=> true
product.class.included_modules #=> [Loggable, Kernel]

product = Product.new
#引数が自クラス、includeしているモジュール、スーパークラスのいずれかに該当すればtrue
product.is_a?(Product) #=> true
product.is_a?(Loggable) #=> true
product.is_a?(Object) #=> true


module Taggable
    def price_tag
        #priceメソッドはinclude先で定義されているはず、という前提
        "#{price}円"
    end
end

class Product
    include Taggable
    
    def price
        1000
    end
end

product =Product.new
product.price_tag #=> "1000円"
#selfを書いていないが、include先のインスタンスになる

module Taggable
    def price_tag
        #あえてselfをつけて呼び出しても良い(privateメソッドでなければ)
        #self はinclude先のクラス(例えばProduct)のインスタンスになる
        "#{self.price}円"
    end
end


#############################################
# Enumerable_module
#############################################

#配列やハッシュなど繰り返し処理が可能なクラスにincludeされているモジュール

Array.include?(Enumerable) #=> true
Hash.include?(Enumerable) #=> true
Range.include?(Enumerable) #=> true

#Enumrable の代表的なメソッド
# map select find count

#############################################
# Comparable_module && <=>
#############################################
#比較演算を行うモジュール
#Comparableの代表的なメソッド

# < <= == > >= between?

class Tempo
    include Comparable

    attr_reader :bpm

    #bpmはBeats Per Minuteの略で音楽を表す単位
    def initialize(bpm)
        @bpm = bpm
    end
    
    #<=> は Comparableモジュールで使われる演算子(メソッド)

    def <=>(other)
        if other.is_a?(Tempo)
            #　bpm同士を<=>で比較した結果を返す
            bpm <=> other.bpm
        else
            nil

        end
    end
    
    #irb上で結果を見やすくするためにinspectメソッドをオーバーライド
    def inspect
        "#{bpm}bpm"
    end
end

t_120 = Tempo.new(120) #=> 120bpm
t_180 = Tempo.new(180) #=> 180bpm

t_120 > t_180 #=> false
t_120 <= t_180 #=> true
t_120 == t_180 #=> false

tempos = [Tempo.new(180), Tempo.new(60), Tempo.new(120)]
# sortメソッドの内部では並び替えの際に<=>演算子が使われる
tempos.sort #=> [60bpm, 120bpm, 180bpm]


#############################################
# Kernel_module
#############################################

#kernel_moduleメソッド例
# puts p prind require loop

#Objectクラスがkernelモジュールをincludeしているため、どこでも普通に使うことができる。

class User
end

#Userクラス自身のクラスはClassクラス
User.class #=> Class

#Classクラスのスーパークラスはmoduleクラス
Class.superclass #=> Module

module Loggable
end

#Loggableモジュール自身のクラスはModuleクラス
Loggable.class #=> Module

#Moduleクラスのスーパークラスはobjectクラス
Module.superclass #=> Object
