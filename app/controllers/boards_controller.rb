class BoardsController < ApplicationController
  before_action :authenticate_user!

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_parms.merge(user: current_user))

    if @board.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_parms
    params.require(:board).permit(:name)
  end
end
