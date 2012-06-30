class Blacklist < ActiveRecord::Base

	attr_accessible :username
	
	
	def self.blacklisted?(username)
		Blacklist.exists?(:username => username)
	end

end
