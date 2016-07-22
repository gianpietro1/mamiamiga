class PostsController < ApplicationController

  def index
  	@posts = Post.all
    authorize @posts
  end

  def show
  	@post = Post.friendly.find(params[:id])
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
    if @post.published_at > Time.now
      @post.update_attributes(private: true)
      @post.delay(run_at: @post.published_at).make_public
    end
	   flash[:notice] = "Post guardado"
	   redirect_to @post
	 else
	   flash[:error] = "Hubo un error al guardar el post, por favor reintentar."
	   render :new
	 end
  end

  def edit
	  @post = Post.friendly.find(params[:id])
  end

  def update
		@post = Post.friendly.find(params[:id])
    authorize @post
		if @post.update_attributes(post_params)
      if @post.published_at > Time.now
        @post.update_attributes(private: true)
        @post.delay(run_at: @post.published_at).make_public
      end
		 flash[:notice] = "Post actualizado."
		 redirect_to @post
		else
		 flash[:error] = "Hubo un error al actualizar el post, por favor reintentar."
		 render :edit
		end
  end

  def froala_image_upload
    uploader = PostImageUploader.new
    file = params[:file]
    uploader.store!(file)
    render json: { success: true }
    rescue CarrierWave::IntegrityError => e
     render json: { error: e.message }
  end

  private
 
  def post_params
     params.require(:post).permit(:title, :topic_id,:published_at, :content, :bootsy_image_gallery_id, :featured_image, :slider_image, :slider, :featured, :private)
  end
  
end
