require "../lib/rubydux"
require 'drb/drb'

# The URI for the server to connect to
URI = "druby://localhost:8787"

# The object that handles requests on the server
combine_reducers = Rubydux::CombineReducers.new

switch_counter = -> (state, action) {
  case action[:type]
  when :increment
    state[:count] = state[:count] + 1
    state
  when :decrement
    state[:count] = state[:count] - 1
    state
  else
    state
  end
}

counter_store = Rubydux::Store.new({ count: 0 }, &switch_counter)

combine_reducers.add(name: :counter_store, store: counter_store)

DRb.start_service(URI, combine_reducers)
# Wait for the drb server thread to finish before exiting.
DRb.thread.join
