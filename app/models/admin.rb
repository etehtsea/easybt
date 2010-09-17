class Admin
  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable,
  # :recoverable, :registerable and :timeoutable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable
  field :username
end

