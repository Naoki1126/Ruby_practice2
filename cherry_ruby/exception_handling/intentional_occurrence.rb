def currency_of(country)
    case country
    when :japan
        puts 'yen'
    when :us
        puts 'dollar'
    when :india
        puts 'rupee'
    else
        #意図的に例外を発生させる
        raise "無効な国名です #{country}"　#raise メソッドに文字列を渡すとエラーメッセージになる
    end
end

currency_of(:japan) #=> yen
currency_of(:italy) #=> 無効な国名です


def currency_of(country)
    case country
    when :japan
        puts 'yen'
    when :us
        puts 'dollar'
    when :india
        puts 'rupee'
    else
        #意図的に例外を発生させる
        raise
    end
end

# RunTimeError メッセージが無いのは良くない


def currency_of(country)
    case country
    when :japan
        puts 'yen'
    when :us
        puts 'dollar'
    when :india
        puts 'rupee'
    else
        #RunTimeErrorではなく、ArgumentErrorを発生させる
        raise ArgumentError, "無効な国名です #{country}"
    end
end

currency_of(:italy) #=> ArgumentError: 無効な国名です。italy
#raiseの第一引数には起こしたい例外、第二引数にはエラーメッセージを


def currency_of(country)
    case country
    when :japan
        puts 'yen'
    when :us
        puts 'dollar'
    when :india
        puts 'rupee'
    else
        #RunTimeErrorではなく、ArgumentErrorを発生させる
        raise ArgumentError.new("無効な国名です #{country}")
    end
end

currency_of(:italy) #=> ArgumentError: 無効な国名です。italy
#例外クラスもオブジェクトであるため、インスタンスを作成することが出来る

