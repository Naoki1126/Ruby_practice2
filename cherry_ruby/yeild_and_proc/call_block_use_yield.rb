def greeting
    puts 'おはよう'
    puts 'こんばんは'
end
puts '普通の処理'
greeting
puts '普通の処理ここまで'

#ここまでは普通

greeting do 
    puts 'こんにちは'
end

#=> おはよう
#=> こんばんは

def greeting
    puts 'おはよう'
    #ここでブロックの処理を呼び出す
    yield
    yield
    #yieldの数だけブロックが呼ばれる
    puts 'こんばんは'
end

greeting do
    puts "こんにちは"
end

#yieldが使われているのにも関わらずブロックを使わずにメソッドを呼ぶとエラーになる。
# greeting #=> `greeting': no block given (yield) (LocalJumpError)

def greeting
    puts 'おはよう'
    if block_given? #呼び出し先にてブロックが実行されているかを判別
        yield
    end
    puts 'こんばんは'
end

greeting #=> おはよう こんばんは

greeting do
    puts 'こんにちは'
end

#=>  おはよう
#=> こんにちは
#=> こんばんは

###############################################33#3
def greeting
    puts 'おはよう'
    #ブロックに引数を渡し、戻り値を受け取る
    text = yield 'こんにちは'
    # ブロックの戻り値をコンソールに出力する
    puts text
    puts 'こんばんは'
end

greeting do |text| #textには引数のこんにちは格納されている
    text * 2
end

#=> おはよう
# こんにちはこんにちは
#  こんばんは

def greeting
    puts 'おはよう'
    #2この引数をブロックに渡す
    text = yield 'こんにちは',12345
    puts text
    puts 'こんばんは'
end

greeting do |text|
    # ブロック引数が1つであれば、2つめの引数は無視される
    text * 2
end

#=> おはよう
# こんにちはこんにちは
# こんばんは

def greeting
    puts 'おはよう'
    #1個の引数をブロックに渡す
    text = yield 'こんにちは'
    puts text
    puts 'こんばんは'
end

greeting do |text,other|
    # ブロック引数が2つであれば、2つめの引数はnilになる　
    text * 2 + other.inspect
end

#=> おはよう
#   こんにちはこんにちはnil
#   こんばんは