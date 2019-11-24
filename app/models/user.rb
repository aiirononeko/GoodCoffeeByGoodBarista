class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :sex, presence: true
  validates :birthday, presence: true

  has_one_attached :image

  def thumbnail
    return self.image.variant(resize: '300*300')
  end
end
