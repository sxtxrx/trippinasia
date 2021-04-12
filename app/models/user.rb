class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
  validates :profile, presence: true
  has_many :prototypes,dependent: :destroy
  has_many :comments,dependent: :destroy


# エラー要素
  has_many :likes, dependent: :destroy
  has_many :like_prototypes, through: :likes, source: :prototype

end
