require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#new" do
    it "正常なレスポンス" do
      get :new
      expect(response).to be_successful
    end

    it "200レスポンス" do
      get :new
      expect(response).to have_http_status "200"
    end
  end
end
