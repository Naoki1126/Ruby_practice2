class NoCountryError < StandardError
    #オプジェクトなので継承してクラスとして作成する
end

def currency_of(country)
    case country
    when :japan
        'yen'
    when :us
        'dollar'
    when :india
        'rupee'
    else
        # 独自に定義したNocountryErrorを発生させる
        raise NoCountryError, "無効な国名です。 #{country}"
    end
end

currency_of(:italy) #=> NoCountryError: 無効な国名です。 italy

#独自のメソッドや属性を追加することもできる

class NoCountryError < StandardError
    #国名を属性として取得できるようにする
    attr_reader :country

    def initialize(message, country)
        @country = country
        @message = message
    end

end

def currency_of(country)
    case country
    when :japan
        'yen'
    when :us
        'dollar'
    when :india
        'rupee'
    else
        # NoCountryErrorを発生させる
        raise NoCountryError.new('無効な国名です', country)
    end
end

begin
    currency_of(:italy)
rescue NoCountryError => each
    #エラーメッセージと国名を出力する
    puts e.message
    puts e.country
end

#=> 無効な国名です。 italy
#=> italy
