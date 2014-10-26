module Notification
  module Subscriber
    class NotesSubscriber < PushStarter::Subscriber
      def find_endpoints
        @user.endpoints.map do |endpoint|
          NotifiNotes::Endpoints::MobileDevice.new(endpoint)
        end
      end

      def subscribe(topic)
        # noop
      end

      def unsubscribe(topic)
        # noop
      end
    end
  end
end
