require 'rails_helper'

RSpec.describe ProductController, type: :controller do

  describe "GET #query" do
    it "returns http success" do
      get :query
      expect(response).to have_http_status(:success)
    end
  end

end
