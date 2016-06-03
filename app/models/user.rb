class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :validatable, :authentication_keys => [:email]

  validates :username, :presence => true, :uniqueness => {:case_sensitive => false}
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  has_many :reviews

  has_many :restaurants, :through => :reviews

  

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
end
