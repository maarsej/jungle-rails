class User < ActiveRecord::Base
  before_save :downcase_fields

  has_secure_password

  has_many :reviews
  validates :password, presence: true, confirmation: true, length: {minimum: 5}
  validates :password_confirmation, presence: true
  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}

  def self.authenticate_user(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

  def downcase_fields
    self.email.downcase!
  end
end
