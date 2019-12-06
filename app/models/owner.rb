class Owner < ApplicationRecord
  has_secure_password

  validates :company, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :tel, presence: true

  has_one_attached :image
end
