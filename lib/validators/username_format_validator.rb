class UsernameFormatValidator < ActiveModel::EachValidator  
  
  def validate_each(object, attribute, value)  
    unless value =~ /^[A-Za-z0-9_]+$/  
      object.errors[attribute] << (options[:message] || "is not formatted properly")  
    end  
  end  
  
end  