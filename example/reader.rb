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

reader = DRbObject.new_with_uri(SERVER_URI)

loop do
  puts reader[:counter_store]
  sleep 2
end


DRb.stop_service
