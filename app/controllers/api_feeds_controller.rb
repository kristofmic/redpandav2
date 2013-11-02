class ApiFeedsController < ApplicationController

  def index
    unless signed_in?
      render json: {error_message: "Please login to access your feeds, or sign up today to create one!"}, status: 401
    else
    	@feeds = {}
    	Feed.all.each do |feed|
    		@feeds[feed.id] = { 
  													title: feed.title,
  													url: feed.url,
  													last_modified: feed.last_modified,
  													feed_entries: feed.feed_entries.sort{ |a,b| b.published_at <=> a.published_at }.first(5)
  												}
    	end
      render json: @feeds.to_json
    end
  end

end