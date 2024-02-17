class EventsController < ApplicationController
  def index
    @events = current_user&.user_events
  end

  def create
    respond_to do |format|
      current_user.user_events.create!(name: "#{params[:type].camelcase}", type: params[:type])
      format.html { redirect_to root_path, notice: 'Event created successfully.' }
    end
  end
end
