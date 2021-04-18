class Artwork < ApplicationRecord
    has_one_attached :cover_image
    has_many :artwork_parts, dependent: :destroy
    validates :title, 
    presence: true, 
    length: { minimum: 5 },
    uniqueness: { message: 'already exists!' }
    validates :cover_image, presence: true
    scope :active, -> { where(active: true) }
    validate :image_type

    def next
        Artwork.where("id > ?", id).first || Artwork.first
    end
    
    def prev
        Artwork.where("id < ?", id).first || Artwork.last
    end

    private

    def image_type 
        if cover_image.attached? == true
            if !cover_image.content_type.in?(%('image/jpeg image/png'))
                cover_image.purge
                errors.add(:cover_image, "needs to be a jpeg or png!")
            end
        end
    end

    # def image_size 
    #     mini_img = ImageProcessing::MiniMagick.source(cover_image.download)
    #     mini_img.resize_to_fit('200x200').call
    #     v_filename = cover_image.filename
    #     v_content_type = cover_image.content_type
    #     cover_image.purge
    #     cover_image.attach(io: File.open(mini_img.path), 
    #         filename:  v_filename, 
    #         content_type: v_content_type)
    # end
end
