class ArtworkPartsController < ApplicationController
  before_action :set_artwork
  before_action :set_artwork_part, only: [:show, :destroy]
  before_action :authenticate_admin!, except: [:show]

  # GET /artwork_parts/1
  # GET /artwork_parts/1.json
  def show
  end

  # GET /artwork_parts/new
  def new
    @artwork_part = ArtworkPart.new
  end

  # POST /artwork_parts
  # POST /artwork_parts.json
  def create
    @artwork_part = @artwork.artwork_parts.new(artwork_part_params)

    resize_image

    respond_to do |format|
      if @artwork_part.save
        format.html { redirect_to @artwork, notice: 'Artwork part was successfully created.' }
        format.json { render :show, status: :created, location: @artwork_part }
      else
        format.html { render :new }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artwork_parts/1
  # DELETE /artwork_parts/1.json
  def destroy
    @artwork_part.destroy
    respond_to do |format|
      format.html { redirect_to @artwork, notice: 'Artwork part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:artwork_id])
    end
    def set_artwork_part
      @artwork_part = @artwork.artwork_parts.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def artwork_part_params
      params.require(:artwork_part).permit(:text, :artwork_id, :part_image)
    end

    def resize_image
      image = artwork_part_params[:part_image]
      unless image.nil?
        mini_img = MiniMagick::Image.new(image.tempfile.path)
        mini_img.resize('500x500')
      end
    end
end
