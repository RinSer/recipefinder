class Recipe
	include HTTParty

	key_value = ENV['FOOD2FORK_KEY']
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'http://food2fork.com'

	base_uri "#{hostport}/api"
	default_params key: key_value
	format :json

	def self.for meal
		get("/search", query: { q: meal})['recipes']
	end
end