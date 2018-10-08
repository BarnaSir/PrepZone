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

class Competescore < ApplicationRecord
  belongs_to :user
  belongs_to :competition
end
