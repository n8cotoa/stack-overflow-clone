class User < ApplicationRecord
  attr_accessor :password
  validates_confirmation_of :password
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
  before_save :encrypt_password
  has_many :posts
  has_many :responses
  before_destroy :destroy_responses_and_posts

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

  def destroy_responses_and_posts
    self.responses.destroy_all
    self.posts.destroy_all
  end

  def toggle_admin_status

    if self.permission == 'user'
      self.update(permission: 'admin')
    else
      byebug
      self.update(permission: 'user')
    end
  end
end
