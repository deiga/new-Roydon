class User
  include Mongoid::Document

  before_create :set_random_password
  after_initialize :migrate_data
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String
  field :encrypted_password, type: String, :default => ""

  validates :email, presence: true

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, :default => 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Name
  field :first_name,  type: String
  field :last_name,   type: String

  ## Relations
  has_and_belongs_to_many :user_groups, class_name: 'Shop::UserGroup'

  ## Encryptable
  # field :password_salt, type: String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  ## Token authenticatable
  # field :authentication_token, type: String

  def is_admin?
    user_groups.map(&:name).include?('admin')
  end
  private

    def migrate_data
      if self[:confirmation_token].blank?
        self.set(:confirmed_at, Time.now)
      end
    end

    def set_random_password
      self.password = Devise.friendly_token
    end
end
