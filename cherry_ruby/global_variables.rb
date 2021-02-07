# グローバル変数の宣言と値の代入
$program_name = "Awesome program"

#グローバル変数に依存するクラス
class Product
    def initialize(name)
        $program_name = name
    end
    
    def self.name
        $program_name
    end

    def name
        $program_name
    end

end

# $program_nameには既に名前が代入されている
Program.name #=> "Awesome program"
program = Product.new("Super program")
program.name #=> Super program

#Program.newのタイミングで$program_nameが"Super program"に変更される
Program.name #=> "Super program"
$program_name #=> "Super prgram"