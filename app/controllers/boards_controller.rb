class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: %i[edit update destroy show]

  def new
    @board = Board.new
  end

  def edit
    authorize @board
  end

  def show
    authorize @board
  end

  def create
    @board = Board.new(board_parms.merge(user: current_user))

    if @board.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    authorize @board
    if @board.update(board_parms)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    authorize @board
    if @board.destroy
      redirect_to root_path
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
