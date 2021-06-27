

a = /abcd/i
p a

puts a.class

a = Regexp.new("abc",Regexp::MULTILINE)
p a

a = Regexp.compile("abc",Regexp::MULTILINE)
p a

a = /abc/
p a.match("abcds")

"abced".match(a)

str = "<HTML><HEAD>"
if md = str.match(/<(\w+)>/)
    puts md[0]
    puts md[1]
end


str1 = "I am a strong man."
p str1.scan(/\w+/)
p str1.scan(/a/)
str2 = "hokkaido:sapporo, aomori:aomori, iwate:morioka"
p str2.scan(/(\w+):(\w+)/)

p "bbbbb" =~ /aaaaaa/

a = /abc/

p a === "aaabc"
p a === 'aaacs'
p a === "zzzz"

$_ = "aaaaaaabc"
p $_

p ~ Regexp.new("abc")
