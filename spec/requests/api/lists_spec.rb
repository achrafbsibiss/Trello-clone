require "rails_helper"

RSpec.describe "Api::Lists", type: :request do
  let(:user) { create(:user) }
  let(:board) { create(:board, user: user ) }
  let!(:lists) { create_list(:list, 3, board: board ) }

  describe "GET /index" do
    it "succeds" do
      get api_board_lists_path(board)
      expect(response).to  be_successful
      expect(JSON.parse(response.body)["data"].count).to eq(3)
      binding.pry
    end
  end
end
