class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
	 @post = Post.new(params.require(:post).permit(:title, :content, :bootsy_image_gallery_id))
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
		if @post.update_attributes(params.require(:post).permit(:title, :content, :bootsy_image_gallery_id))
		 flash[:notice] = "Post actualizado."
		 redirect_to @post
		else
		 flash[:error] = "Hubo un error al actualizar el post, por favor reintentar."
		 render :edit
		end
  end
end
