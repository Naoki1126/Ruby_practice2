def greeting
    puts 'Good Morning'
    puts 'Good Evening'
end

# greeting
#=> Good Morning
#=> Good Evening


def greeting
    puts 'Good Morning'
    yield #=> ブロックの実行 呼び出しもとのブロックが差し込まれる。
    yield #=> yieldの数分ブロックが渡される。
    puts 'Good Evening'
end

greeting do #=> yieldを使用しているためブロックを渡さないとエラーになる。
    puts 'Hello'
end

def greeting
    puts "Good Morning"
    if block_given? #=> 呼び出し元でブロックを実行しているか判別する
        yield
    end
    puts "Good Evening"
end

greeting
#=> Good Morning
#=> Good Evening

greeting do
    puts "Hello"
end

#=> Good Morning
#=> Hello
#=> Good Evening



