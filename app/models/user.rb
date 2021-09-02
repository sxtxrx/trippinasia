class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)\w{6,}\z/
  validates :password,
            format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true do
    validates :name
    validates :profile

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, { presence: true, uniqueness: { case_sensitive: false } }
  end

  has_many :prototypes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :prototype_likes, through: :likes, source: :prototype
end
