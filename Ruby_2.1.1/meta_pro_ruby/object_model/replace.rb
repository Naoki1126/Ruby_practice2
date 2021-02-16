#オーブンクラスの問題点

def replace(array, original, replacement)
    array.map { |e| e == original ? replacement : e}
end

# test code
def test_replace
    original = ['one','two','one', 'three']
    replaced = replace(original, "one", "zero")
    assert_equal ['zero', 'two', 'zero','three'], replace
end

# オーブンクラスを使う

class Array
    def replace(array, original, replacement)
        array.map { |e| e == original ? replacement : e}
    end
end

# test code
def test_replace
    original = ['one','two','one', 'three']
    replaced = original.replace("one", "zero")
    assert_equal ['zero', 'two', 'zero','three'], replace
end

#既にArrayクラスにreplaceメソッドがあるため、独自に上書きしてしまったことになる。モンキーパッチ