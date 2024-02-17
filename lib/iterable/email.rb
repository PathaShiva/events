module Iterable
  class Email < ApiResource
    def trigger_email(user_event)
      body = { recipientEmail: user_event.user.email }
      Iterable.request(conf, '/email/target').post(body)
    end
  end
end
