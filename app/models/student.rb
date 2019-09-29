class Student < ApplicationRecord

  validates :enrollnumber, presence: true, length: {is: 10}, uniqueness: true
  validates :firstname, presence: true, length: {minimum:4, maximum:30}
  validates :lastname, presence: true,  length: {minimum:4, maximum:30}
  validates :branch, presence: true, length: {maximum: 50}
  validates :batch, presence: true
  validates :contact, presence: true, length: {is: 10}, uniqueness: true

end
