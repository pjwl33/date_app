class Chatroom < ActiveRecord::Base
  has_one :match
  has_many :messages
end