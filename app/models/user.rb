class User
  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :encryptable, :encryptor => :sha1
  
  field :username
  field :admin, :type => Boolean, :default => false
  
  validates_presence_of   :username
  validates_length_of     :username, :within => 3..10
  validates_uniqueness_of :username
  validates_format_of     :username,
                          :with   => /^[-\w\._@]+$/i,
                          :message => "should only contain letters, numbers, or .-_@"

  references_many :releases
  
  def admin?
    self.admin
  end
end