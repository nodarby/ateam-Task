class BoardsController < ApplicationController
  def index
    @msg = "Hello, World!"
    @topics=Topic.all
  end

end
