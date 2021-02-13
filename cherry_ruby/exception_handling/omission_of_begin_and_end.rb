1 / 1 rescue 0 #=> 1

1 / 0 rescue 0 #=> 0


require 'date'

def to_date(string)
    begin
        # 文字列のパースを試みる
        Date.parse(string)
    rescue ArgumentError
        # パース出来ない場合はnilを返す
    end
end

# パース可能な文字列を渡す
to_date('2017-01-01') #=> <Date: 2017-01-01 >

# パース不可能な文字列を渡す
to_date('abcder') #=> nil


def to_date(string)
    Date.parse(string) rescue nil
end

to_date('2017-01-01') #<Date: 2017-01-01>
to_date('abcdef') #=> nil

#短く書くことは出来るが、例外クラスの指定は出来ない。
