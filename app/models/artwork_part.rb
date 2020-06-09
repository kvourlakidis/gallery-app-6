class ArtworkPart < ApplicationRecord
  has_one_attached :part_image
  belongs_to :artwork
end
