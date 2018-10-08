# == Schema Information
#
# Table name: competitions
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  category_id   :integer
#  slug          :string
#  starting_date :datetime
#

class Competition < ApplicationRecord
		belongs_to :category
		extend FriendlyId
    friendly_id :name, use: [:slugged, :history]
    def should_generate_new_friendly_id?
        new_record? || slug.blank? || name_changed?
    end
end
