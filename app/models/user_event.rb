class UserEvent < ApplicationRecord
  belongs_to :user
  self.inheritance_column = nil
  enum type: [:event_a, :event_b]

  after_create :create_iterable_event

  private

  def create_iterable_event
    CreateEventsJob.perform_later(user.id, self.id)
  end
end
