class PostsController < ApplicationController
  def new
    @post = Post.new
    3.times do
      @post.links.build
    end

    render :new
  end

  def create
    @post = current_user.posts.build(params[:post])
    params[:links].values.each do |link|
      next if link[:url] == ""
      @post.links.build(link)
    end
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      (3-@post.links.length).times do
        @post.links.build
      end
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end
end
