class Member < ActiveRecord::Base
  require 'digest/md5'
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  attr_accessor :login

  attr_accessible :login

  validate :password_complexity

  def self.find_first_by_auth_conditions(warden_conditions)
	conditions = warden_conditions.dup
	if login = conditions.delete(:login)
	  where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
	else
	  where(conditions).first
	end
  end

  # validation for username
  validates :username,
            :presence => TRUE,
            :uniqueness => {
              :case_sensitive => false
            },
            :length => {
              :minimum => 8,
              :maximum => 20
            }
            
  # password complexity          
  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end

  # add gravatar profile image
  include Gravtastic
  gravtastic  :secure => TRUE,
              :default => "identicon",
              :size => 120

end
