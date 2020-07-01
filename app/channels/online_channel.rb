class OnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def appear
    ActionCable.server.broadcast "online_channel", message: "#{current_user.username}"
  end
end
