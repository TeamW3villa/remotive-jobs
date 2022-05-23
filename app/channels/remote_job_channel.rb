class RemoteJobChannel < ApplicationCable::Channel
  def subscribed
    stream_from "remote_job_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
