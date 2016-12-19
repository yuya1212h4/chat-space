class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :messages
  accepts_nested_attributes_for :users
end
