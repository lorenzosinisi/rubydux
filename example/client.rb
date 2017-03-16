require 'drb/drb'
require 'byebug'

# The URI to connect to
SERVER_URI="druby://localhost:8787"

# Start a local DRbServer to handle callbacks.
#
# Not necessary for this small example, but will be required
# as soon as we pass a non-marshallable object as an argument
# to a dRuby call.
DRb.start_service

red = DRbObject.new_with_uri(SERVER_URI)

puts "Counter before dispatching actions => #{red[:counter_store]}"

10.times do
  red.dispatch(type: :increment)
end

puts "Counter after dispatching actions => #{red[:counter_store]}"

DRb.stop_service
