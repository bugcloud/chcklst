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

class List < ActiveRecord::Base
  has_many :items
  accepts_nested_attributes_for :items,
    reject_if: proc { |obj| obj['title'].blank? }

  validates :title,     presence: true
  validates :list_uuid, presence: true,
                        uniqueness: true

  before_validation :set_list_uuid

  private
    def set_list_uuid
      self.list_uuid = SecureRandom.uuid
    end
end
