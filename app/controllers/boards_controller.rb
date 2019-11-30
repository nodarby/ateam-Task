class BoardsController < ApplicationController
  def index
    @msg = "Hello, World!"
    @topics=Topic.all
  end

  def new
    @msg = "Create"
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to({action: :show, id: @topic.id}, notice: 'Topic was successfully created.')}
        format.json { render :show, status: :created, location: @topic}
      else
        format.html {render :new}
        format.json {render json: @topic.errors, status: :unprocessable_entity}
      end
    end
  end

  before_action :set_topic, only: [:show]

  def show

  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title)
    end
end
