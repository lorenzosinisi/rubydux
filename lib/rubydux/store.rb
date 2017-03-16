module Rubydux
  class Store
    attr_reader :state
    INITIALIZE_RUBYDUX = 'INITIALIZE_RUBYDUX'.freeze

    def initialize(initial_state = nil, &reducer)
      @state     = initial_state
      @reducer   = Rubydux::Reducer.new(reducer)
      dispatch({
        type: INITIALIZE_RUBYDUX
      })
    end

    def dispatch(action)
      @state = @reducer.call(@state, action)
    end

    def to_a
      state
    end
  end
end
