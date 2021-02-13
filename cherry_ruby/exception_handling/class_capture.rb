
begin
    #例外が起きうる処理
    1/0
rescue ZeroDivisionError => e
    
    puts "0で除算しました"
    puts e.class
    puts e.message
end

begin
    # NomethodErrorを発生させる
    'abc'.foo
rescue ZeroDivisionError
    puts '0で除算されました'
end

#例外は捕捉されない
#NoMethodError: undefined method 'foo'