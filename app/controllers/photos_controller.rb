class PhotosController < ApplicationController

  def index
    
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index.html.erb" })
  end

  def show
    
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id})
    @the_photo = matching_photos.at(0)
    
    render({ :template => "photo_templates/show.html.erb" })
  end

  def delete_the_photo

    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy
    
    #render({ :template => "photo_templates/delete_the_photo.html.erb" })

    redirect_to("/photos")
  end

  def create
    
    #https://www.chicagobooth.edu/-/media/project/chicago-booth/why-booth/north-america/chicago-booth-uchicago-campus.jpg?cx=0.59&cy=0.56&cw=940&ch=749&hash=399733267B8702EE5E9A5C00DC831BDD

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    #render({ :template => "photo_templates/create.html.erb" })
    redirect_to("/photos/" + a_new_photo.id.to_s)

  end

end
