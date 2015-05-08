# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  list_uuid  :string(255)      not null
#  archived   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_lists_on_list_uuid  (list_uuid) UNIQUE
#

FactoryGirl.define do
  factory :list do
    title "MyString"
list_uuid "MyString"
archived false
  end

end
