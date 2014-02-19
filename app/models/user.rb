class User < ActiveRecord::Base

  validates_presence_of :email, :nickname, :commits

  def self.find_or_create_from_auth_hash(auth_hash)
    @user = User.find_or_create_by(
      email: auth_hash[:info][:email],
      nickname: auth_hash[:info][:nickname]
    )
  end

end
