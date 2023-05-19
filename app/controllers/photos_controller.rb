class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    photo = Photo.new(photo_params)
    photo.user_id = current_user.id
    photo.save
    redirect_to photos_path

  end

  def show
  end

  def edit
  end

  private

  def photo_params
    params.require(:photo).permit(:photo_name,:caption,:photo)
  end
end
