# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  checked    :boolean          default(FALSE), not null
#  list_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
  belongs_to :list
end
