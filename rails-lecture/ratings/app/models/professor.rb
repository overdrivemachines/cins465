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
end
