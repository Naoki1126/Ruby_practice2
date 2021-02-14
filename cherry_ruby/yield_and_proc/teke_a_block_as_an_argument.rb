#ブロックをメソッドの引数として受け取る
# def メソッド(&引数)
#     #プロっくを実行する
#     引数.call
# end

#ブロックをメソッドの引数として受け取る
def greeting(&block)
    puts 'おはよう'
    # callメソッドを使ってブロックを実行する
    text = block.call('こんにちは')
    puts text
    puts 'こんばんは'
end

greeting do |text|
    text * 2
end

# おはよう
# こんにちはこんにちは
# こんばんは

#ブロックが渡されたかどうかの判別

def greeting(&block)
    puts 'おはよう'
    # ブロックが渡されていなければblockはnil

    unless block.nil?
        text = block.call('こんにちは')
        puts text
    end
    puts 'こんばんは'
end


#ブロックなしで呼び出す
greeting
# おはよう
# こんばんは

#ブロック付きで呼び出す
greeting do |text|
    text * 2
end

# おはよう
# こんにちはこんにちは
# こんばんは

############################################

def greeting(&block)
    puts 'おはよう'
    # 引数のblockを使わずにblock_given?やyieldを使ってもいい
    if block_given?
        text = yield 'こんにちは'
        puts text
    end
    puts 'こんばんは'
end
