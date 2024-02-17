class CreateEventsJob < ApplicationJob
  queue_as :default

  def perform(user_id, event_id)
    begin
      user = User.find(user_id)
      event = user.user_events.find(event_id)
      create_event event
    rescue => e
      Rails.logger.info "#{e.message} #{e.backtrace.take(5).join("\n")}"
      # notify the error via any platform eg: email
    end
  end

  def create_event event
    events = Iterable::Events.new
    response = events.create_event(event)
    raise "Unable to create Event" unless response.success?
    event.update(event_created_at: Time.now)
    trigger_email(event) if event.event_b?
  end

  def trigger_email event
    email = Iterable::Email.new
    response = email.trigger_email(event)
    raise "Unable to send email for event: #{event.id}" unless response.success?
    event.update(email_delivered_at: Time.now)
  end
end
