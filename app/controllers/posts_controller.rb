class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all()
  end

  def show
    @comment = Comment.new
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
    @post.user = User.first  # TODO:  Change once authentication is set up

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
    if @post.update(post_params)
      flash[:notice] = "Your post was updated."
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private 
  def post_params
    params.require(:post).permit(:title, :url, :description, :user, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
