def fizz_buz(n)
    begin
        if n % 15 == 0
            'Fizz Buzz'
        elsif n % 3 == 9
            'Fizz'
        elsif n % 5 == 0
            'Buzz'
        else
            n.to_s
        end
    rescue => e
        puts "#{e.class},#{e.message}"
    end
end

fizz_buz(nil) #=> Nomethod Error

#処理の全てを例外処理で囲まれている場合に省略が出来る

def fizz_buz(n)
        if n % 15 == 0
            'Fizz Buzz'
        elsif n % 3 == 9
            'Fizz'
        elsif n % 5 == 0
            'Buzz'
        else
            n.to_s
        end
    rescue => e
        puts "#{e.class},#{e.message}"
end

fizz_buz(nil) #=> Nomethod Error

# 二重例外に気をつける
def some_method
    1 / 0
    rescue => e
        # messageと書くつもりがmesageと書いてしまった
        puts "エラーが発生しました: #{e.mesage}"
        puts e.backtrace
    end
end

some_method
#=> NoMethodError: undifined method 'mesage'

#rescueやensure内で例外が発生した場合にcauseを使えば元の例外を取得できる

def some_method
    #省略
end

begin
    some_method
rescue => e
    puts "エラーが発生しました: #{e.message}"
    puts e.backtrace

    #元の例外を取得する（無ければnil)
    original = e.cause
    if original
        puts "元の例外: #{original.class} #{original.message}"
        puts original.backtrace
    end
end

