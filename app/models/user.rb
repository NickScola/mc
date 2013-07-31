class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # attr_accessible :title, :body
  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name
  
  has_many :statuses
  
  def gravatar_url
  
  	stripped_email = email.strip
  	downcase_email = stripped_email.downcase
  	hash = Digest::MD5.hexdigest(downcase_email)
  	
  	"http://gravatar.com/avatar/#{hash}"
  
  end
  
end
