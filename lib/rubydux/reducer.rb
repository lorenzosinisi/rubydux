module Rubydux
  class Reducer
    attr_reader :cases

    def initialize(cases)
      @cases = cases || default_lambda
    end

    def call(state, action)
      cases.call(state, action)
    end

    private

    def default_lambda
      -> (*) {}
    end

  end
end
