# == Schema Information
#
# Table name: answers
#
#  id             :integer          not null, primary key
#  answer_content :string
#  correct        :boolean
#  question_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :question
	# validates :answer_content, presence: true
end
