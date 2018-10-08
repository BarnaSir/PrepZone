# == Schema Information
#
# Table name: competescores
#
#  id             :integer          not null, primary key
#  score          :integer
#  user_id        :integer
#  competition_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  rank           :integer
#

require 'test_helper'

class CompetescoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
