class User < ActiveRecord::Base

  before_save :blacklist

  has_many :authentications
  
  # username*, name, email*, dob, (gender -> add)
  
  validates :username, :presence => true, :uniqueness => true, :username_format => true
  validates :email, :uniqueness => true, :email_format => true  
  validates_presence_of :name
  
  
  def apply_omniauth(omniauth)
    self.email = omniauth['info']['email'] if email.blank?
    self.name = omniauth['info']['name'] if name.blank?
    self.username = omniauth['info']['nickname'] if username.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  
  private
  
  # Determine if attributes are not on the blacklist
  def blacklist
    return !Blacklist.exists?(:username => self.username)
  end

end
