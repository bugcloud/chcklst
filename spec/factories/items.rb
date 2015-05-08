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

FactoryGirl.define do
  factory :item do
    title "MyString"
checked false
list_id 1
  end

end
