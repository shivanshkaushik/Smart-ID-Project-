class Student < ApplicationRecord
  before_create :confirmation_token
  before_save {self.email = email.downcase}

  NUMBER_REGEX = /\A\d+\z/

  validates :enrollnumber, presence: true,
            length: {mimumum:9, maximum: 11, message: "Enter a valid enrollment number(9-11 digits only) or,Enter the number without any leading zeroes"},
            uniqueness: true,
            format: {with: NUMBER_REGEX, message: "Only numbers should be entered in the specified field"}
  validates :firstname, presence: true,
            length: {minimum:4, maximum:30},
            uniqueness: {case_sensitive: false}
  validates :lastname, presence: true,
            length: {minimum:4, maximum:30}
  validates :branch, presence: true,
            length: {maximum: 50}
  validates :batch, presence: true,
            format: {with: NUMBER_REGEX, message: "Only numbers should be entered in the specified field"}

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

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!
  end

private
    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
