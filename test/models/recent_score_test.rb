# == Schema Information
#
# Table name: recent_scores
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  exam_id     :integer
#  temp        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

require 'test_helper'

class RecentScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
