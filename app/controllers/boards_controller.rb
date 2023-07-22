class BoardsController < ApplicationController
  before_action :authenticate_user!

  def new
    @board = Board.new
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end
end
