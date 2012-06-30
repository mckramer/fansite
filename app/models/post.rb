##
# The post object
#
class Post < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessible :title, :subtitle, :body, :teaser

  # Validations
  validates_presence_of :title
  validates_presence_of :body
  
  ##
  # Overrides to_param to include title
  # @override
  def to_param
    "#{id}-#{title.parameterize}"
  end 
  
end
