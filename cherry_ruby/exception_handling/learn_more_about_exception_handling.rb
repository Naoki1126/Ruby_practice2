# ensure

begin 
    # 例外が発生するかもしれない処理
rescue
    # 例外発生時の処理
ensure
    #　例外の有無に関わらず実行する処理
end


file = File.open('some.txt','w')

begin
    # ファイルに文字列を書き込む
    file << 'Hello'
ensure
    # 例外の有無に関わらず必ずファイルをクローズする
    file.close
end

#ブロック付きでオープンすると、メソッドの実行後に自動的にクローズされる
File.opne('some.txt', 'w') do |file|
    file << 'Hello'
    #わざと例外を発生させる
    1/0
end

# 例外は発生するが、必ずクローズする
#=> ZeroDivisionError

# else

begin
    # 例外が発生するかもしれない処理
rescue
    # 例外発生時の処理
else
    # 例外が発生しなかった場合の処理
ensure
    # 例外の有無に関わらず実行する処理
end

# elseを使わない場合
begin
    puts 'Hello,'
    puts '例外は発生しませんでした。'
rescue
    puts '例外が発生しました。'
end

#=> "hello"
#=> '例外は発生しませんでした。'