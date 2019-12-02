class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment].permit(:post_id, :text))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to({controller: :boards, action: :show, id: @comment.post_id}, notice: '返信を行いました')}
        format.json { render action :show, status: :created, location: @comment}
      else
        format.html {render action :show , id: @comment.id }
        format.json {render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  before_action :set_comment, only: [:destroy]

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to({controller: :posts, action: :show, id: @comment.post_id}, notice: '投稿が削除されました')}
      format.json { head :no_content}
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
