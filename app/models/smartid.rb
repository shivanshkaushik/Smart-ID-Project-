class Smartid < ApplicationRecord
  belongs_to :student
  NUMBER_REGEX = /\A\d+\z/
  # FLOAT_NUMBER_REGEX = /^[+-]?([1-9]\d*|0)(\.\d+)?$/

  validates :user_id, presence: true,
            format: {with: NUMBER_REGEX}
  validates :balance, presence: true
  validates :last_transaction, presence: true
  validates :dues, presence: true

end
