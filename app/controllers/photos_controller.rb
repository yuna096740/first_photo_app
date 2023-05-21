class PhotosController < ApplicationController
  def index
    @photos = Photo.all
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
    @photo = Photo.find(params[:id])
    @photo_comment = PhotoComment.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    photo = Photo.find(params[:id])
    photo.update(photo_params)
    redirect_to photos_path
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:photo_name,:caption,:photo)
  end
end
