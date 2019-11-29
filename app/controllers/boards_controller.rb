class BoardsController < ApplicationController
  def index
    @msg = "Hello, World!"
    @topics=Topic.all
  end

  def new
    @msg = "Create"
    @topic = Topic.new
  end
end
