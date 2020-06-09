class WelcomeController < ApplicationController
def index
    @artworks = active_artworks
end

private
    def active_artworks
        Artwork.active
    end
end
