module Notification
  module Event
    module Note
      class Post < PushStarter::Event
        def name
          'post_event'
        end

        def alert(subscriber)
          "#{subscriber.user.name}: #{source.body[0..50]}"
        end

        def sound
          'voice.wav'
        end

        def publish_to_self?
          true
        end
      end
    end
  end
end
