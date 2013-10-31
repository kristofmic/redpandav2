# == Schema Information
#
# Table name: feed_entries
#
#  id           :integer          not null, primary key
#  feed_id      :integer
#  title        :string(255)
#  url          :string(255)
#  author       :string(255)
#  summary      :text
#  content      :text
#  published_at :datetime
#  guid         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FeedEntry < ActiveRecord::Base
  attr_accessible :guid, :title, :published_at, :summary, :url, :author, :content

  belongs_to :feed

  def self.add_feed_entries(feed, entries)
    entries.each { |entry| add_feed_entry feed, entry }
  end 

  def self.add_feed_entry(feed, entry)
    unless exists? guid: entry.id
      feed.feed_entries.create(guid: entry.id,
                title: entry.title,
                url: entry.url,
                author: entry.author,
                summary: entry.summary,
                content: entry.content,
                published_at: entry.published
               )
    end
  end
end
