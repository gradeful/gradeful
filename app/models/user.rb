class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  # Gives the ability to save a hashed password to the database.
  # Generates password and password_confirmation attributes.
  # Provides and authenticate method that returns the user iF the password is correct
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

end
