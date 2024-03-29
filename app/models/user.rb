class User < ActiveRecord::Base
  attr_accessible :email, :password
  attr_reader :password

  validates :email, :presence => true
  validates :password_digest, :presence => true
  validates :password, :length => { :minimum => 6, :allow_nil => true }

  after_initialize { self.session_token ||= self.class.generate_session_token }

  has_many(
  :circles,
  :class_name => 'Circle',
  :primary_key => :id,
  :foreign_key => :user_id,
  :dependent => :destroy
  )

  has_many :posts

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_email(username)

    if user
      user.is_password?(password) ? user : nil
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  def reset_password_reset_token!
    self.password_reset_token = SecureRandom.urlsafe_base64(16)
    self.save!
  end
end
