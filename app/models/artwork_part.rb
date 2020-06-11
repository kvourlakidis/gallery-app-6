class ArtworkPart < ApplicationRecord
  has_one_attached :part_image
  belongs_to :artwork
  validate :image_type

  private

  def image_type 
    if part_image.attached? == true
      if !part_image.content_type.in?(%('image/jpeg image/png'))
          part_image.purge
          errors.add(:part_image, "needs to be a jpeg or png!")
      end
    end
  end
end
