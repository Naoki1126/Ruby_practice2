class Computer
    def initialize(computer_id, data_source)
        @id = computer_id
        @data_source = data_source
    end

    def mouse
        info = @data_source.get_mouce_info(@id)
        price = @data_source.get_mouce_price(@id)
        result = "Moush: #{info} (#{price})"
        return "#{result}" if price >= 100
    end

    def cpu
        info = @data_source.get_cpu_info(@id)
        price = @data_source.get_cpu_price(@id)
        result = "Cpu: #{info} (#{price})"
        return "#{result}" if price >= 100
    end

    def keyboard
        info = @data_source.get_keyboard_info(@id)
        price = @data_source.get_keyboard_price(@id)
        result = "keyboard: #{info} (#{price})"
        return "#{result}" if price >= 100
    end

    #............
end
