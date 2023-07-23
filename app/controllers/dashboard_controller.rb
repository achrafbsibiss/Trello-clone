class DashboardController < ApplicationController
  before_action :user_signed_in?

  def index
    @boards = Board.all
  end
end
