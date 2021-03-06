class User < ActiveRecord::Base
  attr_accessible :crypted_password, :login, :password_salt, :persistence_token, :password, :password_confirmation, :email, :register_number, :mobile_number, :role
  ROLES = %w(student staff)
  
  # Authentication
  acts_as_authentic
  
  # Validations
  validates :register_number, presence: true, if: Proc.new { |user| user.student? }
  validates :mobile_number, presence: true
  validates :role, presence: true
  
  # Associations
  has_many :medias
  
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
