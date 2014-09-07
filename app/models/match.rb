class Match < ActiveRecord::Base
  # has a match_id and user_id - Self Referential Association
  belongs_to :chatroom

  def self.check_matches(current_user_id, match_id)
    match_made = []
    Match.all.each do |m|
      if (m.user_id == current_user_id && m.match_id == match_id) || (m.user_id == match_id && m.match_id == current_user_id)
        m.match_confirm = true
        m.save
        match_made << m
      end
    end
    if match_made.empty? == true
      Match.create({
        user_id: current_user_id,
        match_id: match_id,
        user_confirm: true,
        match_confirm: false
        })
    end
  end
end