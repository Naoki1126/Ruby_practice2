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