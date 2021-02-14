def generate_proc(array)
    counter = 0

    # Procオブジェクトをメソッドの戻り値とする
    Proc.new do
        # ローカル変数のcounterを加算する
        counter += 10

        array << counter
    end
end

values = []
sample_proc = generate_proc(values)
values #=> []

puts sample_proc.call
puts sample_proc.call
puts sample_proc.call

############################

