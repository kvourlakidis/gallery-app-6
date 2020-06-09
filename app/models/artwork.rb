class Artwork < ApplicationRecord
    has_one_attached :cover_image
    has_many :artwork_parts, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :cover_image, presence: true
end
