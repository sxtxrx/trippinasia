class Prototype < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :country

    belongs_to :user
    has_many :comments,dependent: :destroy
    has_one_attached :image

    with_options presence: true do
    validates :image
    validates :title
    validates :access
    validates :information
    validates :country_id
    end
    validates :country_id, numericality: { other_than: 0 } 

    

end
