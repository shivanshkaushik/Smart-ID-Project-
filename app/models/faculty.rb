class Faculty < ApplicationRecord
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  NUMBER_REGEX = /\A\d+\z/
  validates :firstname, presence: true

  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            length: {maximum: 105},
            format: {with: VALID_EMAIL_REGEX, message: "Enter a valid email address"}

  validates :teaching_field, presence: true

  validates :contact, presence: true,
            length: {is: 10},
            uniqueness: true,
            format: {with: NUMBER_REGEX, message: "Only numbers should be entered in the specified field"}

  validates :designation, presence: true

  has_secure_password
end
