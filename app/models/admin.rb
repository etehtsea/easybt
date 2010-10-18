class Admin
  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable,
  # :recoverable, :registerable and :timeoutable
  #devise :database_authenticatable,
  #       :rememberable, :registerable, :trackable, :validatable
  devise :database_authenticatable, :trackable, :timeoutable,
         :lockable
  attr_accessible :email, :password, :password_confirmation
  field :username
end

