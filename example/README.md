# Redux implementation in Ruby

Cd into the ``example`` folder
Open two windows in your terminal and run 'ruby server.rb' in the first one, 'ruby client.rb' in the second. See what happens. 

# What is going on?

The server knows about store, holds reducer lambdas and can add new stores to the root store (it is just an hash), plus it contains the logic to handle the dispatched actions.

# How can this be used?

The client dispatches actions to the remote store that consequentially dispatches the actions to each registered store. What is cool about that is that you can have one remote store and dispatch actions from different distributed clients, consequentially the store is accessible to any client to be read.

# Test it

   ``bundle && rspec``

# Have an idea?

Create a PR or fork this repo and use this code for some experiment :)

# Plus

You can also run the ``reader.rb`` in another tab of you terminal and see changes live when the clients dispatches an action to the remote store.