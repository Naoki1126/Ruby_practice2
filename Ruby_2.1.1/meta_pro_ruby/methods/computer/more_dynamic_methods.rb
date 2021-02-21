class Computer
    def initialize(compter_id, data_source)
        @id = compter_id
        @data_source = data_source
        data_source.my_methods.grep(/^get_(.*)_info$/){ Computer.define_component $1 }
    end

    def self.define_component(name)
        define_method(name) do
        end
    end
end
