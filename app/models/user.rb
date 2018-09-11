class User < ApplicationRecord
  attr_accessor :password
  validates_confirmation_of :password
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
  before_save :encrypt_password
  has_many :posts
  has_many :responses

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(account, password)
    user = User.find_by "email = ? OR name = ?", account, account
    # user_name = User.find_by "name = ?",
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
