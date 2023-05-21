class PhotoCommentsController < ApplicationController

  def create
    photo = Photo.find(params[:photo_id])
    comment = current_user.photo_comments.new(photo_comment_params)
    comment.photo_id = photo.id
    comment.save
    redirect_to photo_path(photo.id)
  end

  def destroy
    PhotoComment.find(params[:id]).destroy
    redirect_to photo_path(params[:photo_id])
  end

  private

  def photo_comment_params
    params.require(:photo_comment).permit(:comment)
  end
end
