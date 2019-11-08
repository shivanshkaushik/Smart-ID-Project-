class Admin < ApplicationRecord

  before_save {self.email = email.downcase }

  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  NUMBER_REGEX = /\A\d+\z/

  validates :firstname, presence: true

  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 5, maximum: 105},
            format: {with: VALID_EMAIL_REGEX, message: "Enter a valid email address"}

  validates :contact, presence: true,
            length: {is: 10},
            uniqueness: true,
            format: {with: NUMBER_REGEX, message: "Only numbers should be entered in the specified field"}

  has_secure_password
  
end