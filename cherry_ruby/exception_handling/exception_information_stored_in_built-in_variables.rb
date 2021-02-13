#最後に発生した例外は組み込み変数の$!に格納
#バックトレースは$@に格納される

begin
    1 / 0
rescue => e
    puts "#{e.class} #{e.message}"
    puts e.backtrace
end

#=> ZeroDivisionError
#=> バックトレースは省略

# 組み込み変数$!と$@に格納された例外情報を扱う

begin
    1 / 0
rescue
    puts "#{$!.class} #{$!.message}"
    puts $@
end

#上と同じことをしている