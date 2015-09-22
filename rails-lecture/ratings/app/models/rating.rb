# == Schema Information
#
# Table name: ratings
#
#  id           :integer          not null, primary key
#  course       :string
#  comment      :string
#  professor_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  rating       :integer
#

class Rating < ActiveRecord::Base
  belongs_to :professor

  validates :course, presence: true
  validates :comment, presence: true
  validates :rating, presence: true
end
