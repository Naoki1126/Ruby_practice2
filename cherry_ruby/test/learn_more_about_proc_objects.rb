# how to call a proc object

add_proc = Proc.new { |a,b| a + b}

# use call method
add_proc.call(10,20) #=> 30

# use yield method
add_proc.yield(10,20) #=> 30

# use .()
add_proc.(10,20) #=> 30

# use []
add_proc[10,20] #=> 30

# use ===
add_proc === [10,20] #=> 30

# why use === ?
def judge(age)
    # true if greater than 20
    adult = Proc.new{ |n| n > 20 }

    # true if less than 20
    child = Proc.new{ |n| n < 20 }

    case age
    when adult
        '大人です'
    when child
        '子供です'
    else
        '二十歳です'
    end
end

judge(25) #=> 大人です
judge(18) #=> 子供です
judge(20) #=> 二十歳です

# & & to_proc method

reverse_proc = Proc.new { |s| s.reverse }
["Ruby", 'Java', 'Perl'].map(&reverse_proc) #=> ["ybuR", "avaJ", "lreP"]


reverse_proc = Proc.new{ |s| s.reverse }
other_proc = reverse_proc.to_proc
reverse_proc.equal?(other_proc) #=> true

split_proc = :split.to_proc

# case one argument 'a-b-c-d','e'.split
split_proc.call('a-b-c-d','e') #=> ['a-b-c-d','e']

# case two arguments 'a-b-c-d e'.split('-')と同じ
split_proc.call('a-b-c-d e','-')

# case three aruguments 'a-b-c-d e'.split('-',3)
split_proc.call('a-b-c-d e','-',3) #=> ['a','b','c-d e']
