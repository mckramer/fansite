class User < ActiveRecord::Base

  #before_save :blacklist

  has_many :authentications
  has_many :updates
  
  # username*, name, email*, dob, (gender -> add)
  
  validates :username, :presence => true, :uniqueness => true, :username_format => true
  validates :email, :uniqueness => true, :email_format => true  
  validates_presence_of :name
  
  
  def apply_omniauth(omniauth)
    self.email = omniauth['info']['email'] if email.blank?
    self.name = omniauth['info']['name'] if name.blank?
    self.username = omniauth['info']['nickname'] if username.blank?
    self.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
  
  def display
    return "@#{self.username}"
  end
  
  def age
    now = Time.now.utc.to_date
    now.year - self.dob.year - ((now.month > self.dob.month || (now.month == self.dob.month && now.day >= self.dob.day)) ? 0 : 1)
  end
  
  GENDER_OPTIONS = %w[male female other]
  
  def admin?
    :admin == role
  end
  
  def editor?
    role == :editor || admin?
  end
  
  def moderator?
    role == :moderator || editor?
  end
  
  ROLE_OPTIONS = %w[moderator editor admin]
  
  private
  
  # Determine if attributes are not on the blacklist
  def blacklist
    return !Blacklist.exists?(:username => self.username)
  end

end
