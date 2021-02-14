#ブロックを引数として受けるメリット
# ブロックを他のメソッドの引数にすることができる

# 日本語版のgreetingメソッド
def greeting_ja(&block)
    texts = ['おはよう','こんにちは','こんばんは']
    #ブロックを別のメソッドに引き渡す
    greeting_common(texts, &block)
end

# 英語版のgreetingメソッド
def greeting_en(&block)
    texts = ['good morning', 'hello', 'good evening']
    # ブロックを別のメソッドに引き渡す
    greeting_common(texts, &block)
end

#出力処理用の共通メソッド
def greeting_common(texts,&block)
    puts texts[0]
    #  ブロックを実行する
    puts block.call(texts[1])
    puts texts[2]
end

#　日本語版のgreetingメソッドを呼び出す
greeting_ja do |text|
    text * 2
end

# おはよう
# こんにちはこんにちは
# こんばんは

#英語版のgreetingメソッドを呼び出す
greeting_en do |text|
    text.upcase
end

# good morning
# HELLO
# good evening

#メソッドの引数としてブロックを渡す場合は必ず&をつける
#つけないとただの変数として扱われてしまう

#############################
# arity  ブロック引数の個数を確認することができる

def greeting(&block)
    puts 'おはよう'
    text =
        if block.arity == 1
            yield 'こんにちは'
        elsif block.arity == 2
            yield 'こんに','ちは'
        end
    puts text
    puts 'こんばんは'
end

# 1個のブロック引数でメソッドを呼び出す
greeting do |text|
    text * 2
end

# おはよう
# こんにちはこんにちは
# こんばんは

#2個のブロック引数でメソッドを呼び出す
greeting do |text_1,text_2|
    text_1 * 2 + text_2 * 2
end

#ブロックから引数を渡している、do |,|のなかに引数を渡すイメージ？
# おはよう
# こんにこんにちはちは
# こんばんは
