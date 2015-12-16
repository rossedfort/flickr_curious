class AlbumsController < ApplicationController
  def index
    user = flickr_user(current_user.uid)
    @albums = Album.all(user_id: user.id)
  end

  def show
    @album_photos = Album.show(params[:id])
  end
end
