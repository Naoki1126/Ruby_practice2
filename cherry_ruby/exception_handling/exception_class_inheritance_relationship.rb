begin
    #例外が発生しそうな処理
rescue
    # StandardErrorとそのサブクラスのみ捕捉される
end

#通常のプログラムでの例外のほとんどはStandardError < Exception を継承

#悪い例
begin
    #例外が起こりうる処理
rescue Exception
    # Exceptionとそのサブクラスが捕捉される。つまりNoMemoryErrorやSystemExitまで捕捉されてしまう
end

#間違った例外処理の例
begin
    #NoMethodErrorを発生させる
    'abc'.foo
rescue NameError
    #NoMethodErrorはここで捕捉される
    puts "NameErrorです"
rescue NoMethodError
    # このrescue節は永遠に実行されない
    puts 'NoMethodErrorです。'
end

#=> NameErrordです
#スーバークラスで捕捉が完了しているため

begin
    'abc'.foo
rescue NoMethodError
    # NoMethodErrorはここで捕捉される
    puts "NoMethodErrorです"
rescue NameError
    puts 'NameErrorです'
end

#=> NoMethodErrorです
# NameErrorが発生した場合にも対応が出来る


begin
    Foo.new
rescue NoMethodError
    # NoMethodErrorはここで捕捉される
    puts "NoMethodErrorです"
rescue NameError
    puts 'NameErrorです'
end

#=> NameErrorです


#############################################


begin
    # ZeroDivisionErrorを発生させる
    1 / 0
rescue NoMethodError
    puts 'NoMethodErrorです'
rescue NameError
    puts 'NameErrorです'
rescue #例外クラスを指定しない
    puts 'その他のエラーです'
end


