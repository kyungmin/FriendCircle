class CirclesController < ApplicationController
  def new
    @circle = Circle.new
    render :new
  end

  def create
    @circle = current_user.circles.build(params[:circle])
    if @circle.save
      redirect_to @circle
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end

  def show
    @circle = Circle.find(params[:id])
    render :show
  end

  def index
    @circles = current_user.circles
    render :index
  end
end
