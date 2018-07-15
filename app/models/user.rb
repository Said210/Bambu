class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :registration_code
  belongs_to :access_level

  ####### User takes course ###########
  has_many :enrollments, class_name: 'UserTakesCourse', foreign_key: :student_id, dependent: :destroy
  has_many :enrolled_courses, through: :enrollments, source: :enrolled_course

  ####### User teaches course #########
  has_many :teachings, class_name: 'UserTeachesCourse', foreign_key: :teacher_id, dependent: :destroy
  has_many :taught_courses, through: :teachings, source: :taught_course

  has_many :questions

  # Virtual atribute to receive registration code from form
  attr_accessor :code
  # This virtual attribute allows a user to sign in by email or username
  attr_writer :login
  validate :presence_of_registration_code
  validate :valid_registration_code
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  validates :username, presence: :true, uniqueness: true

  before_validation :assign_default_access_level, :assign_registration_code
  after_create :assign_default_role, :redeem_registration_code

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["(username) = :value OR (email) = :value", { value: login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

  def assign_default_role
    self.add_role(:student) if self.roles.blank?
  end

  def assign_default_access_level
    self.access_level = AccessLevel.find_by(level: 1)
  end

  # Based on the code sent via registration form, retrieve the registration code
  def assign_registration_code
    unless self.code.nil?
      rc = RegistrationCode.find_by(code: self.code)
      self.registration_code = rc
    end
  end

  # After validation and validating the registration code hasn't been redeemed yet 
  def redeem_registration_code
    unless self.registration_code.nil?
      self.registration_code.redeem
    end
  end

  def presence_of_registration_code
    if self.code.nil?
      errors.add(:registration_code, "must be present")
    end
  end
  # If exists, check if the code hasn't been redeemed
  def valid_registration_code
    if self.registration_code.nil?
      errors.add(:registration_code, "is not valid")
    elsif self.registration_code.redeemed?
      errors.add(:registration_code, "has already been redeemed")
    end
  end

end
