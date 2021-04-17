class WelcomeController < ApplicationController
def index
    @artworks = active_artworks
end

def contact
end

private
    def active_artworks
        Artwork.active
    end
end
