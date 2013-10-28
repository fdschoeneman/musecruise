class User < ActiveRecord::Base

  # required setup for rolify gem
  rolify

  # required setup for devise
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # associations
  has_many :tour_requests, as: :tourist, class_name: "Tour"
  has_many :users_tours

  # validations
  validates_presence_of :email
  validates_presence_of :first_name, on: :update
  validates_presence_of :last_name, on: :update
  validates_presence_of :phone, on: :update

  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end
