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

require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
