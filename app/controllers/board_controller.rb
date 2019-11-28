class BoardController < ApplicationController
  def index
    @msg = "Hello, World!"
    render 'board/index'
  end

end
