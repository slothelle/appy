class ImagesController < ApplicationController
  def new
    @image = Image.new
    @pattern = Pattern.find(params[:pattern_id])
    @images = @pattern.images
  end

  def create
    @image = Image.new(params[:image])
    @image.pattern = Pattern.find(params[:pattern_id])
    if @image.save
      flash[:notice] = "Image #{@image.photo_file_name} successfully added to #{@image.pattern.name}"
      redirect_to patterns_path
    else
      redirect_to new_pattern_image_path(params[:pattern_id])
    end
  end

  def destroy
    Image.destroy(params[:id])
  end

  def show
  end
end