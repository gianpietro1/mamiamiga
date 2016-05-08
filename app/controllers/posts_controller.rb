class PostsController < ApplicationController

  def index
  	@posts = Post.all
    authorize @posts
  end

  def show
  	@post = Post.find(params[:id])
    authorize @post
  end

  def new
  	@post = Post.new
    authorize @post
  end

  def create
   @post = current_user.posts.build(post_params)
   authorize @post
	 if @post.save
	   flash[:notice] = "Post guardado"
	   redirect_to @post
	 else
	   flash[:error] = "Hubo un error al guardar el post, por favor reintentar."
	   render :new
	 end
  end

  def edit
	  @post = Post.find(params[:id])
  end

  def update
		@post = Post.find(params[:id])
    authorize @post
		if @post.update_attributes(post_params)
		 flash[:notice] = "Post actualizado."
		 redirect_to @post
		else
		 flash[:error] = "Hubo un error al actualizar el post, por favor reintentar."
		 render :edit
		end
  end

  private
 
  def post_params
     params.require(:post).permit(:title, :content, :bootsy_image_gallery_id, :featured_image, :slider_image, :slider, :featured, :private)
  end
  
end
