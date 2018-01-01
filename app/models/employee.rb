class Employee < ApplicationRecord
  validates :first_name, :last_name, :username, :password_digest, :session_token, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: { maximum: 250 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }

  after_initialize :ensure_session_token

  def self.find_by_username(username, password)
    user = Employee.find_by(username: username)
    user && user.is_password?(password) ? user : nil
  end

  def self.find_by_email(email, password)
    user = Employee.find_by(email: email)
    user && user.is_password?(password) ? user : nil
  end

  def self.gen_session_token
    SecureRandom.urlsafe_base64(16)
  end

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = Employee.gen_session_token
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= Employee.gen_session_token
  end
end
