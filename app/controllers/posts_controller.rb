class PostsController < ApplicationController

  def create
    @post = Post.new(params[:post].permit(:topic_id, :text))

    respond_to do |format|
      if @post.save
        format.html { redirect_to({controller: :boards, action: :show, id: @post.topic_id}, notice: '投稿が作成されました')}
        format.json { render action :show, status: :created, location: @post}
      else
        format.html {render action :show , id: @post.id }
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  before_action :set_post, only: [:show, :destroy]

  def show
    @comments = Comment.where(post_id: params[:id])
    @newcomment = Comment.new(:post_id => params[:id])
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to({controller: :boards, action: :show, id: @post.topic_id}, notice: '投稿が削除されました')}
      format.json { head :no_content}
    end
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:text, :topic_id)
  end
end
