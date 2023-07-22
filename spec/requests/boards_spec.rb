require 'rails_helper'

RSpec.describe 'Boards', type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) do
    {
      name: 'New Title'
    }
  end

  let(:invalid_attributes) do
    {
      name: ''
    }
  end

  before do
    sign_in user
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_board_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /creat' do
    context 'with valid params' do
      before do
        post boards_path, params: {board: valid_attributes}
      end

      it 'redirect to dashboard' do
        expect(response).to have_http_status(:redirect)
      end

      it 'creates a new announcement' do
        expect(Board.count).to eq(1)
      end
    end
  end

  context 'with valid params' do
    before do
      post boards_path, params: {board: invalid_attributes}
    end

    it 'redirect to dashboard' do
      redirect_to root_path
    end

    it 'creates a new announcement' do
      expect(Board.count).to eq(0)
    end

    it 'returns an unprocessable entity status' do
      expect(response).to  have_http_status(:success)
    end
  end
end
