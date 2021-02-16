require 'monetize'

bargain_price = Monetize.from_numeric(99, "USD")
bargain_price.format #=> $99.00

standard_price = 100.to_money("USD")
standard_price.format #=> $100.00


#to_moneyの定義は一体どこに？

#classをオーブンしてメソッドを定義している（外部ライブラリではよくある）

class from_numeric
    def to_money(currency = nil)
        Monetize.from_numeric(self, currency || Money.default_currency)
    end
end
