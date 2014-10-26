module Notification
  module Topic
    class Note < PushStarter::Topic
      def find_subscribers
        [source.user]
      end
    end
  end
end
