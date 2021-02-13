# 正常終了

ret =
    begin
        'OK'
    rescue
        'error'
    ensure
        'ensure'
    end
ret #=> OK

#例外が発生した場合
ret =
    begin
        1 / 0
    rescue
        'error'
    ensure
        'ensure'
    end

ret #=> 'error'

#メソッドの戻り値としても使用できる
def some_method(n)
    begin
        1 / n
        'OK'
    rescue
        'error'
    ensure
        'ensure'
    end
end

some_method(1) #=> OK
some_method(0) #=> error

#return はensureに書いてはいけない。全ての戻り値がensureのものになる

def some_method(n)
    begin 
        1 / n
        'OK'
    rescue
        'error'
    ensure
        # ensure 節にreturnを書く
        return 'ensure'
    end
end

some_method(2) #=> ensure
some_method(0) #=> ensure

#rescueを消していた場合でも正常終了として扱われてしまう
def some_method(n)
    begin
        1 / n
        'OK'
    ensure
        return 'ensure'
    end
end

some_method(1) #=> ensure

# ZeroDivisionErrorが発生するはず
some_mehod(0) #=> ensure
#正常終了してしまう