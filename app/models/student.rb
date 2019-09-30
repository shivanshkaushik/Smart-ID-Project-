class Student < ApplicationRecord

  before_save {self.email = email.downcase}

  NUMBER_REGEX = /\A\d+\z/
  validates :enrollnumber, presence: true, length: {is: 10}, uniqueness: true
  validates :firstname, presence: true, length: {minimum:4, maximum:30}, uniqueness: {case_sensitive: false}
  validates :lastname, presence: true,  length: {minimum:4, maximum:30}, uniqueness: {case_sensitive: false}
  validates :branch, presence: true, length: {maximum: 50}
  validates :batch, presence: true, format: {with: NUMBER_REGEX, message: "Only numbers should be entered in the specified field"}
  validates :contact, presence: true,
            length: {is: 10},
            uniqueness: true,
            format: {with: NUMBER_REGEX, message: "Only numbers should be entered in the specified field"}

  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            length: {maximum: 105},
            format: {with: VALID_EMAIL_REGEX, message: "Enter a valid email address"}

  has_secure_password          
end
