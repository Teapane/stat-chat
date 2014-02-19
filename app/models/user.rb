class User < ActiveRecord::Base

  validates_presence_of :email

  def self.find_or_create_from_auth_hash(auth_hash)
    User.find_or_create_by(email: auth_hash[:info][:email])
  end

end
