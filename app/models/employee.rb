class Employee < ApplicationRecord
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :first_name, :last_name, :username, :password_digest, :session_token, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: { maximum: 250 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }

  has_many :tasks
  has_many :sub_tasks
  has_many :departments,
    through: :employeeDepartments,
    source: :department

  after_initialize :ensure_session_token

  def self.find_by_credentials(username_or_email, password)
    if Employee.is_valid_email?(username_or_email)
      return Employee.find_by_email(username_or_email, password)
    else
      return Employee.find_by_username(username_or_email, password)
    end
  end

  def self.find_by_username(username, password)
    employee = Employee.find_by(username: username)
    employee && employee.is_password?(password) ? user : nil
  end

  def self.find_by_email(email, password)
    employee = Employee.find_by(email: email)
    employee && employee.is_password?(password) ? user : nil
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

  private

    def self.is_valid_email?(email)
      email =~ VALID_EMAIL_REGEX
      email.nil? ? false : true
    end
end
