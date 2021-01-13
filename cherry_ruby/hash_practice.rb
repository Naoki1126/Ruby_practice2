#キーワード引数
def buy_burger(menu,drink:true,potato: true)

    if menu
        print "#{menu}を購入"
    end
    if drink
        print "ドリンクを購入"
    end
    if potato
        p "ポテトを購入"
    end
end

buy_burger('cheese',drink: true,potato: true)

buy_burger('fish',drink: true,potato: true)

buy_burger('teriyki')

buy_burger('humberger',drink: false,potato: false)

def buy_burger_no_symbol(menu,drink:,potato:)

    if menu
        print "#{menu}を購入"
    end
    if drink
        print "ドリンクを購入"
    end
    if potato
        p "ポテトを購入"
    end
end

buy_burger_no_symbol('cheese',drink: true,potato: true)
params = {drink: true, potato: false} #paramsはシンボルのため引数として使える。
buy_burger_no_symbol('teriyaki',params)