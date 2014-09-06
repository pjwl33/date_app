class Match < ActiveRecord::Base
  # has a match_id and user_id - Self Referential Association
  belongs_to :chatroom
end