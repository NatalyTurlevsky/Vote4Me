class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas

  # Setup accessible (or protected) attributes for your model
  #gem 'protected_attributes'
  #attr_accessible :name, :email, :password, :password_confirmation, :remember_me

end
