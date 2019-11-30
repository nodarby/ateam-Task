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
        format.html { redirect_to({action: :show, id: @topic.id}, notice: 'スレッドが作成されました')}
        format.json { render :show, status: :created, location: @topic}
      else
        format.html {render :new}
        format.json {render json: @topic.errors, status: :unprocessable_entity}
      end
    end
  end

  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to({action: :show, id: @topic.id}, notice: 'スレッドを更新しました')}
        format.json { render :show, status: :ok, location: @topic}
      else
        format.html {render :edit}
        format.json {render json: @topic.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'スレッドが削除されました'}
      format.json { head :no_content}
    end
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title)
    end
end
