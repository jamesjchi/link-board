class User < ActiveRecord::Base
  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}
  
  validates :name,
  presence: true,
  length: {maximum: 20}

  validates_presence_of :password, on: :create

  has_secure_password

  has_many :post
  has_many :comment
  has_many :ratings, class_name: 'Vote'
  has_many :votes, as: :votable

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end
