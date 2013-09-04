class User < ActiveRecord::Base
  attr_accessible :crypted_password, :login, :password_salt, :persistence_token, :password, :password_confirmation, :email, :register_number, :mobile_number, :role
  ROLES = %w(student staff)
  
  acts_as_authentic
  
  validates :register_number, presence: true
  validates :mobile_number, presence: true
  
  def admin?
    role == "admin"
  end
  
  def student?
    role == "student"
  end
  
  def staff?
    role == "staff"
  end
end
