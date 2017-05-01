class PhotosController < ApplicationController

  def index
    @list_of_all_my_photos = Photo.all
    render("photos/index.html.erb")
  end

  def new_form
    render("photos/new.html.erb")
  end

  def create_row
    url = params[:da_source]
    cap = params[:da_caption]
    new_photo = Photo.new
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save
    # render("photos/create_photo.html.erb")
    redirect_to("/photos")
  end

  def show
    the_id = params[:id]
    @my_photo = Photo.find(the_id)
    render("photos/show.html.erb")
  end

  def edit_form
    @id = params[:id]
    @photo = Photo.find(@id)
    render("photos/edit_form.html.erb")
  end

  def update_row
    # Having issues with this one!!!!!!!!!!!
    @id = params[:id]
    url = params[:da_newsource]
    cap = params[:da_newcaption]
    new_photo = Photo.find(@id)
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save

    redirect_to("/photos/#{new_photo.id}")
    # render("photos/show.html.erb")
  end

  def destroy_row
    @id = params[:id]
    p = Photo.find(@id)
    p.destroy
    redirect_to("/photos")
  end
end
