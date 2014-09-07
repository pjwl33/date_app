class User < ActiveRecord::Base
  belongs_to :dislike
  has_many :messages

  validates_presence_of :uid, :name, :oauth_token, :oauth_expires_at
  validates_uniqueness_of :uid, :oauth_token
  # user.interest refers to gender of interest btw

  def self.from_omniauth(auth)
    # binding.pry
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image
      user.gender = check_gender(auth.extra.raw_info.gender)
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def gender?
    self.gender == true ? "man" : "woman"
  end

  def men_or_women?(type)
    type == true ? "Men" : "Women"
  end

  def self.check_gender(type)
    type.downcase == "male" ? true : false
  end

  # just for development match tests
  def self.seed_dislikes(nums)
    User.all.each do |u|
      u.dislikes_id = nums.sample
      u.save
    end
  end
end
