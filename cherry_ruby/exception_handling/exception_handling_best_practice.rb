#大量のメールをユーザーに送信する(例外が起きても最後まで続行する)
users.each do |user|
    begin
        #メール送信を実行する
        send_mail_to(user)
    rescue => e
        puts e.class #例外のクラス名、エラーメッセージ、バックトレースを出力する
        puts e.message #ログファイルがあれば、そこに出力する方がベター
        puts e.backtrace
    end
end


#beginの範囲を広げすぎない

require 'date'

#平成の日付文字列をDateオブジェクトに変換する
def convert_heisei_to_date(heisei_text)
    begin
        m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
        year = m[:jp_year].to_i + 1988
        month = m[:month].to_i
        day = m[:day].to_i
        Date.new(year,month,day)
    rescue
        # 例外が起きたら（=無効な日付が渡されたら）nilを返したい
        nil
    end
end

#上記だとタイプミスであってもnilを返してしまう
#下の方が望ましい
def convert_heisei_to_date(heisei_text)
    
    m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
    year = m[:jp_year].to_i + 1988
    month = m[:month].to_i
    day = m[:day].to_i
    # 例外処理の範囲を狭め、捕捉する例外クラスを限定する
    begin
        Date.new(year,month,day)
    rescue ArugumentError
        # 例外が起きたら（=無効な日付が渡されたら）nilを返したい
        nil
    end
end

convert_heisei_to_date('平成28年12月31日') #=> <Date: 2016-12-31>
convert_heisei_to_date('平成28年99月99日') #=> nil


#もし例外の発生がある程度予想できるのであれば、実際に実行する前に問題の有無を確認できる場合があります。
# Date.valide_date? #=> Dateクラス？のメソッド、日付が存在するかを判定
require 'date'
def convert_heisei_to_date(heisei_text)

    m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
    year = m[:jp_year].to_i + 1988
    month = m[:month].to_i
    day = m[:day].to_i

    # 正しい日付の場合のみ、Dateオブジェクトを作成する
    if Date.valid_date?(year,month,day)
        Date.new(year, month, day)
    end
end

convert_heisei_to_date('平成28年12月31日') #=> <Date: 2016-12-31>
convert_heisei_to_date('平成28年99月99日') #=> nil

#when節で処理を書く場合は例外時、安易な処理を書かない

#良く無いバターン　
# not else

def currency_of(country)
    case country
    when :japan
        'yen'
    when :us
        'dollar'
    when :india
        'rupee'
    end
end
#想定外の国名を渡すとnil
currency = currency_of(:italy) #=> nil
#戻り値がnilじゃないことを想定して実装

currency.upcase #=> NomethodError : undefinedf method 'upcace' for nil:Nilclass

# else に一意の処理を実装してしまう例
def currency_of(country)
    case country
    when :japan
        'yen'
    when :us
        'dollar'
    else
        'rupee'
    end
end

#矛盾した値が返却されてしまう
currency_of(:italy) #=> rupee

#良いパターン　想定外が来た場合は速やかに処理を中断させる。

def currency_of(country)
    case country
    when :japan
        'yen'
    when :us
        'dollar'
    when :india
        'rupee'
    else
        raise ArugumentError, "無効な国名です #{country}"
    end
end

#例外の発生
currency_of(:italy) #=> ArgumentError: 無効な国名です。italy
