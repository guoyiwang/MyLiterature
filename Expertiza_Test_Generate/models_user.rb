require 'digest'

class User < ApplicationRecord
  has_many :credit_cards, dependent: :destroy # credit_cards are the instances in credit_card model
  has_many :transactions, :dependent => :destroy
  before_destroy :check_is_admin, prepend: true

  accepts_nested_attributes_for :credit_cards

  validates :name, presence: { message: "is required" }
  validates :email, presence: { message: "is required" }, uniqueness: { message: "you provided has already been used"},
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be formatted correctly" }
  validates :password, presence: { message: "is required" }
  validates :phone_number, presence: { message: "is required" }, format: {with: /\A([0-9]{10})\z/, message: "must be 10 digits long"}
  validates_type :date_of_birth, :date, presence: true, message: "is required and should be valid"
  validates :address, presence: { message: "is required" }
  validates :is_admin, inclusion: {in: [true, false]}
  validate :birth_date_cannot_be_in_the_future

  def birth_date_cannot_be_in_the_future
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "can't be in the future")
    end
  end

  def password= (p)
    unless p.nil? || p.blank?
      super Digest::SHA256.hexdigest(p)
    else 
      super password
    end   
  end

  def age
    (Time.zone.now - date_of_birth.to_time) / (1.year.seconds)
  end

  def check_is_admin
    if self.is_admin == true
      errors.add(:is_admin, "Admin accounts cannot be deleted.")
      false
    end
  end
end