class RemotiveJob
	include Sidekiq::Worker

	def perform(search)
		api_url = "https://remotive.com/api/remote-jobs?search=#{search}"
		resp = HTTParty.get(api_url)
		Rails.cache.write(search, resp.body)
	end
end