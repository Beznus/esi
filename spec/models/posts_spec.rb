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

require 'spec_helper'

describe Posts do
  pending "add some examples to (or delete) #{__FILE__}"
end
