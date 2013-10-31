class ApiFeedsController < ApplicationController
  respond_to :json

  def index
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