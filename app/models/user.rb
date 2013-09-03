class User < ActiveRecord::Base
  attr_accessible :crypted_password, :login, :password_salt, :persistence_token, :password, :password_confirmation, :email
  
  acts_as_authentic
end
