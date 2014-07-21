class User < ActiveRecord::Base
  has_many :dislikes
  has_many :matches
  has_many :dates, through: :matches
  has_many :inverse_matches, class_name: "Match", foreign_key: "match_id"
  has_many :inverse_dates, through: :inverse_matches, source: :user

  validates_presence_of :uid, :name, :oauth_token, :oauth_expires_at
  validates_uniqueness_of :uid, :oauth_token

  def self.from_omniauth(auth)
    # binding.pry
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
