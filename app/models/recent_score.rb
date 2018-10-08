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

class RecentScore < ApplicationRecord
  belongs_to :user
  belongs_to :exam
end
