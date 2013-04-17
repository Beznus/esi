# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  tags        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  created_by  :integer
#

class Post < ActiveRecord::Base
  attr_accessible :title, :description, :tags
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 75 }, uniqueness: true
  validates :created_by, presence: true
end
