# == Schema Information
#
# Table name: professors
#
#  id         :integer          not null, primary key
#  first      :string
#  last       :string
#  university :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Professor < ActiveRecord::Base
	has_many :ratings, dependent: :destroy
	accepts_nested_attributes_for :ratings

	validates :first, presence: true
	validates :last, presence: true
	validates :university, presence: true

	def name
		first + ' ' + last
	end
end
