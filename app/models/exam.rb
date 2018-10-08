# == Schema Information
#
# Table name: exams
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#

class Exam < ActiveRecord::Base
    has_many :questions, dependent: :destroy
		accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank
		extend FriendlyId
    friendly_id :name, use: [:slugged, :history]
    def should_generate_new_friendly_id?
        new_record? || slug.blank? || name_changed?
    end
    has_many :scores, dependent: :destroy
    belongs_to :category

    # validates :name, :category, :questions, presence: true

end
