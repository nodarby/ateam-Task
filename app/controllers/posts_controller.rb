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


  private
  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_posts
    @posts = Post.find_by(topic_id: params[:id])
  end

  def post_params
    params.require(:post).permit(:text, :topic_id)
  end
end
