class Note < ActiveRecord::Base
  after_create :send_notification

  def send_notification
    topic = Notification::Topic::Note.new(self)
    event = Notification::Event::Note::Post.new(self)
    topic.post_event(self.user, event)
  end
end
