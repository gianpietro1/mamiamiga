class HomeController < ApplicationController

  def index
  	@posts_slider = Post.slider.first(5)
  	@posts_featured = Post.featured.first(4)
  	@posts_public = Post.not_private.first(4)
  end

  def about
  end

  def vidademami
		@topic = Topic.find_by(name:'Vida de Mami')
		@posts = @topic.posts.paginate(page: params[:page], per_page: 6)
  end

  def modamamas
		@topic = Topic.find_by(name:'Moda Nosotras')
		@posts = @topic.posts.paginate(page: params[:page], per_page: 6)
  end

  def modapeques
		@topic = Topic.find_by(name:'Moda Niños')
		@posts = @topic.posts.paginate(page: params[:page], per_page: 6)
  end

  def engriete
		@topic = Topic.find_by(name:'Engríete')
		@posts = @topic.posts.paginate(page: params[:page], per_page: 6)
  end

  def inspirate
		@topic = Topic.find_by(name:'Inspírate')
		@posts = @topic.posts.paginate(page: params[:page], per_page: 6)
  end

  def novedades
		@topic = Topic.find_by(name:'Novedades')
		@posts = @topic.posts.paginate(page: params[:page], per_page: 6)
  end

end
