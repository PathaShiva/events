module Iterable
  class Events < ApiResource
    def create_event user_event
      body = {
        eventName: user_event.name,
        email: user_event.user.email,
        id: user_event.id.to_s
      }
      Iterable.request(conf, "/events").post(body)
    end
  end
end
