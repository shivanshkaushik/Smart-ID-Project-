class Smartid < ApplicationRecord
  after_initialize :set_defaults
  belongs_to :student
  before_save {self.registration_number = registration_number.to_i}
  NUMBER_REGEX = /\A\d+\z/
  # FLOAT_NUMBER_REGEX = /^[+-]?([1-9]\d*|0)(\.\d+)?$/

  validates :balance, presence: true
  validates :last_transaction, presence: true
  validates :dues, presence: true
  validates :registration_number, presence: true,
            length: {mimumum:9, maximum: 11, message: "Enter a valid enrollment number(9-11 digits only) or,Enter the number without any leading zeroes"},
            format: {with: NUMBER_REGEX, message: ": Only numbers should be entered in specicfied fields"}
  validates :student_id, presence:

  def set_defaults
    self.balance ||= 0.0
    self.last_transaction ||= 0.0
    self.dues ||= 0
    self.student_id ||= Student.first.id
  end
end
