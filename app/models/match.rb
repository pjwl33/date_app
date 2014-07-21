class Match < ActiveRecord::Base
  # has a match_id and user_id - Self Referential Association
  belongs_to :user
  belongs_to :date, class_name: "User"
end