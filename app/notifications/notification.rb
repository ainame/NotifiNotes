module Notification
  module Util
    def self.expand_path(path)
      Rails.root.join("app/notifications/#{path}")
    end
  end

  module Topic
    autoload :Note, Util.expand_path('topic/note')
  end

  module Event
    module Note
      autoload :Post, Util.expand_path('event/note/post')
    end
  end

  module Subscriber
    autoload :NotesSubscriber, Util.expand_path('subscriber/notes_subscriber')
  end

  module Endpoint
    autoload :MobileDevice, Util.expand_path('endpoint/mobile_device')
  end
end
