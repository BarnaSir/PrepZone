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

require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
