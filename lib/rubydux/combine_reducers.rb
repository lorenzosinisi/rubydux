module Rubydux
  class CombineReducers # this is basically the server
    attr_reader :stores

    def initialize
      @stores = {}
    end

    def add(name:, store:)
      @stores.merge!({ name.to_sym => store })
    end

    def [](store_name)
      return stores[store_name].to_a
    end

    def list
      puts @stores
    end

    def dispatch(action)
      puts "ACTION_RECEIVED => #{action}" # TODO remove this puts
      stores.each do |name, store|
        if store.respond_to?(:dispatch)
          store.dispatch(action)
        end
      end
    end
  end
end
