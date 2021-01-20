text = <<TEXT
I love Ruby,
Python is a great langage.
Java and JavaScript are different.
TEXT

text.scan(/[A-Z][A-Za-z]+/)

text2 = <<TEXT
私の郵便番号は1234567です。
僕の住所は6770056です。 兵庫県西脇市板波町1234だよ。
TEXT

puts text2.gsub(/(\d{3})(\d{4})/,'\1-\2')

text3 = "私の誕生日は1977年7月17日です。"
m = /(\d+)年(\d+)月(\d+)日/.match(text3)
p m[0]
p m[1]
p m[2]
p m[3]

m_2 = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text3)
p m_2[:year]
p m_2[:month]
p m_2[:day]
p m_2[0]

if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ text3
    puts "#{year}年#{month}月#{day}日"
else
    puts "失敗"
end

p '123 456 789'.scan(/\d+/)

p '1977年7月17日 2016年7月30日'.scan(/(\d+)年(\d+)月(\d+)日/)

text = "郵便番号は123-4567です"
p text[/\d{3}-\d{4}/]

p text3[/(\d+)年(\d+)月(\d+)日/]
p text3[/(\d+)年(\d+)月(\d+)日/,2]

p text3[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/,:year]
p text3[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/,'month']

p text.slice(/(\d{3})-(\d{4})/)

text = '123,456-789'
p text.split(',')

p text.split(/,|-/)

text = '123,456-789'

hash = { ',' => ':', '-' => '/'}

p text.gsub(/,|-/,hash)

text = '123,456-789'

p text.gsub(/,|-/) { |matched| matched == ',' ? ':' : '/'}