# == Schema Information
#
# Table name: feeds
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  url           :string(255)
#  feed_url      :string(255)
#  etag          :string(255)
#  last_modified :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Feed < ActiveRecord::Base
  attr_accessible :etag, :feed_url, :last_modified, :title, :url

  has_many :feed_entries, dependent: :destroy

  def self.add_feed(feed_url)
  	unless exists? feed_url: feed_url
  		new_feed = Feedzirra::Feed.fetch_and_parse(feed_url)
  		feed = create!(	title: new_feed.title,
						  				url: new_feed.url,
						  				feed_url: new_feed.feed_url,
						  				etag: new_feed.etag,
						  				last_modified: new_feed.last_modified
  									)
  		FeedEntry.add_feed_entries feed, new_feed.entries
  	else
  		update_feed(feed_url)
  	end
  end

  def self.update_feed(feed_url)
  	feed = find_by_feed_url feed_url
  	if feed
  		feed_to_update = Feedzirra::Parser::Atom.new
  		feed_to_update.feed_url = feed.feed_url
  		feed_to_update.etag = feed.etag
  		feed_to_update.last_modified = feed.last_modified

  		last_entry = Feedzirra::Parser::AtomEntry.new
  		last_entry.url = feed.feed_entries.max_by{ |x| x.published_at }.url

  		feed_to_update.entries = [last_entry]

  		updated_feed = Feedzirra::Feed.update(feed_to_update)

  		if updated_feed 
  			if updated_feed.updated? 
					feed = update(feed.id, 
											title: updated_feed.title,
						  				url: updated_feed.url,
						  				feed_url: updated_feed.feed_url,
						  				etag: updated_feed.etag,
						  				last_modified: updated_feed.last_modified
										  )
				end
				FeedEntry.add_feed_entries(feed, updated_feed.new_entries) unless updated_feed.new_entries.blank?
			end
  	end
  	feed
  end

end
