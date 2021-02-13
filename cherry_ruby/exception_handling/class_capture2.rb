begin
    'abc'.foo
rescue ZeroDivisionError
    puts '0で除算しました'

rescue NoMethodError
    puts '存在しないメソッドが呼び出されました。'
end

# =>  エラーはNoMthodErrorのため「存在しないメソッドが呼び出されました。」


begin
    'abc'.foo
rescue ZeroDivisionError,NoMethodError
    puts '0で徐算したか存在しないメソッドが呼び出されました。'
end

#=> どちらかで捕捉する。「0で徐算したか存在しないメソッドが呼び出されました。」　

begin
    'abc'.foo
rescue ZeroDivisionError,NoMethodError => e
    puts '0で徐算したか、存在しないメソッドが呼び出されました'
    puts "エラー： #{e.class} #{e.message}"
end

begin
     'abc'.foo
rescue ZeroDivisionError,NoMethodError => e
    error_message = e.class
    if error_message.to_s == 'ZeroDivisionError'
        puts '0で徐算しました。'
    elsif error_message.to_s == "NoMethodError"
        puts '存在しないメソッドが呼び出されました。'
    end
    puts e.message
    puts e.class
end
