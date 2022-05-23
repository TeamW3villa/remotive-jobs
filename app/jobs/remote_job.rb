# class RemoteJob < ApplicationJob
#   queue_as :default

#   attr_accessor :response

#   def perform(api_url)
#     obj = RemoteJob.new
#     res = HTTParty.get(api_url)
#     p res
#     obj.response = res["jobs"]
#   end
# end
