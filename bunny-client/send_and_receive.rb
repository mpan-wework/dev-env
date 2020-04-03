require 'bunny'

conn = Bunny.new(
  host: '127.0.0.1',
  port: 55672,
  user: 'guest',
  password: 'guest'
)
conn.start

ch = conn.create_channel
q  = ch.queue('bunny.examples.hello_world', auto_delete: true)
x  = ch.default_exchange

q.subscribe do |delivery_info, metadata, payload|
  puts "Received #{payload}"
end

x.publish('Hello!', routing_key: q.name)

sleep 10.0
conn.close
