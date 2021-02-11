require 'singleton'

class Configration
    #Singletonモジュールをincludeする
    include Singleton

    attr_accessor :base_url, :debug_mode

    def initialize
        #設定値を初期化する
        @base_url = ''
        @debug_mode = false
    end
end

#Configrationクラスはnewできない
config = Configration.new
#=> NoMethodError: private method new

#instanceメソッドを使ってインスタンスを取得する
config= Configration.instance
#設定値を設定する
config.base_url = "http://example.com"
config.debug_mode = true

# instanceメソッドを使って再度インスタンスを取得する
other = Configration.instance

#先ほど設定した設定値を取得できる
other.base_url #=> 'http://example.com'
other.debug_mode #=> true

#どちらも全く同じオブジェクトになっている
config.object_id #=> 70250527744820
other.object_id #=> 70250527744820

config.equal?(other) #=> true
