class Team
    COUNTRIES = deep_freeze(['Japan', 'US', 'India'])
end

# 配列自身と配列の全要素がfreezeされている
Team::COUNTRIES.frozen? #=> true オブジェクトがfreezeされていたらtrue
Team::COUNTRIES.all?{ |country| country.frozen? } #=> true ブロックが全てfreezeされていたらtrue

class Bank
    CURRENCIES = deep_freeze( { 'Japan' => 'yen', 'US' => 'doller', 'India' => 'rupee'})
end

# ハッシュ自身とハッシュの全要素（キーと値）がfreezeされている
Bank::CURRENCIES.frozen? #=> true