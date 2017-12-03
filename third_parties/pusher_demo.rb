require 'pusher'

pusher_client = Pusher::Client.new(
    app_id: '430659',
    key: '1b00758eab163a43ad13',
    secret: 'cea1680ff4343c3974bb',
    cluster: 'ap1',
    encrypted: true
)

pusher_client.trigger('my-channel', 'my-event', {
    message: 'hello world'
})