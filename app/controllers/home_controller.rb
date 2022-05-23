class HomeController < ApplicationController
  def index
  end

  def search
    cache_data = get_cache_data(params[:search])
    if cache_data.present?
      parse_and_broadcast(cache_data)
    else
      RemotiveJob.new.perform(params[:search])
      cache_data = get_cache_data(params[:search])
      parse_and_broadcast(cache_data)  
    end
  end

  def get_cache_data(search)
    Rails.cache.read(search)
  end

  def parse_and_broadcast(cache_data)
    result = JSON.parse(cache_data) rescue {}
    @search = result["jobs"]
    ActionCable.server.broadcast "remote_job_channel", content: @search   
  end
end
