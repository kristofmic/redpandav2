namespace :feeds do
	desc "Update all feeds in the database if new entries exist"
	task update: :environment do
		Feed.all.each { |f| Feed.update_feed f.feed_url }
	end	

	desc "Populate database with feeds"
	task populate: :environment do
		sample_feeds.each { |f| Feed.add_feed f }
	end
end

def sample_feeds
	%w( http://feeds.gawker.com/kotaku/full 
			http://feeds.gawker.com/lifehacker/full 
			http://feeds.gawker.com/io9/full 
			http://www.theverge.com/rss/frontpage 
		)
end