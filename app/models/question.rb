# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  question_content :string
#  exam_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Question < ApplicationRecord
	belongs_to :exam
	belongs_to :competition
	has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: :all_blank
	# validates :question_content, presence: true
	# validates :answers, presence: true
end
