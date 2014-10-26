module Notification
  module Endpoint
    class MobileDevice < PushStarter::Endpoints
      def accept?(event)
        true
      end

      def success(topic:, event:, subscriber:)
      end

      def failure(topic:, event:, subscriber:)
      end
    end
  end
end
