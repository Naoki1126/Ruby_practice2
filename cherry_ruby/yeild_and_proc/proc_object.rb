# Helloという文字列を返すprocオブジェクトを作成する
# create a proc object that returns the string Hello

hello_proc = Proc.new do
    'Hello!'
end

# do .. end の代わりに{}を使っても良い
# use {} instead of do .. end

hello_proc = Proc.new{ 'Hello' }

#メソッドを呼び出す時はcallメソッドを使う
#use the call method when calling the method
hello_proc.call #=> "Hello"

#引数付きのメソッドも定義できる
#also define methods with arguments

add_proc = Proc.new{ |a,b| a + b}
add_proc.call(10,20) #=> "30"

#use the default arguments

add_proc = Proc.new{ |a = 0,b = 0| a + b}
add_proc.call #=> 0
add_proc.call(10) #=> 10
add_proc.call(10,20) #=> 30

#use the kernel module proc method instead of Proc.new
add_proc = proc { |a,b| a + b}

#pass a proc object instead of a block
def greeting(&block)
    puts 'good morning'
    text = block.call('hello')
    puts text
    puts 'good evening'
end

def greeting(&block)
    #show block class name
    puts block.class

    puts 'good morning'
    text = block.call('hello')
    puts text
    puts 'good evening'
end

greeting do |text|
    text * 2
end

#=> Proc
#  good morning
#  hellohello
#  good evening

def greeting(&block)
    puts 'good morning'
    text = block.call('hello')
    puts text
    puts 'good evening'
end

# create the proc object and  pass it to the greeting method instead of block
repeat_proc = Proc.new{ |text| text * 2}
greeting(&repeat_proc)
# => good morning
#    hellohello
#    good evening

# pass a proc object as an ordinary argument
# takes a proc object as an argument,not a block
def greeting(arrange_proc)
    puts 'good morning'
    text = arrange_proc.call('hello')
    puts text
    puts 'good evening'
end

#pass a proc object as an ordinary argument
repeat_proc = Proc.new { |text| text * 2}
greeting(repeat_proc)
#=> good morning
#   hellohello
#   good evening

def greeting(proc_1, proc_2, proc_3)
    puts proc_1.call('good morning')
    puts proc_2.call('hello')
    puts proc_3.call('good evening')
end

#preparation of proc object
shuffle_proc = Proc.new { |text| text.chars.shuffle.join}
repeat_proc = Proc.new{ |text| text * 2}
question_proc = Proc.new{ |text| "#{text}?"}

greeting(shuffle_proc,repeat_proc,question_proc)

# mg rnnoogoid
# hellohello
# good evening?


