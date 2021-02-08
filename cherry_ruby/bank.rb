require "./deep_freezable"

class Bank
    extend DeepFreezable

    CURRNCIES = deep_freeze({ 'Japan' => 'yen', 'US' => 'doller', 'India' => 'rupee'})
end
