# == Schema Information
#
# Table name: scores
#
#  id          :integer          not null, primary key
#  score_value :integer
#  user_id     :integer
#  exam_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Score < ApplicationRecord
  belongs_to :user
  belongs_to :exam
end
