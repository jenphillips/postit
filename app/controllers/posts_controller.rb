class PostsController < ApplicationController
  def index
    @posts = Post.all()
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new  # Creates new in-memory post object
  end

  def create
    # binding.pry

    # title = params['title']
    # url = params['url']
    # description = params['description']
    # Post.create({title: title, url: url, description: description})

    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private 
  def post_params
    params.require(:post).permit(:title, :url, :description, :user)
  end

end
