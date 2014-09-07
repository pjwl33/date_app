class Dislike < ActiveRecord::Base
  has_many :users

  validates_presence_of :type_of
  validates_uniqueness_of :type_of
end