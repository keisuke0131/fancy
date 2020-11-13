require 'rails_helper'

RSpec.describe LandingPageController, type: :controller do
  describe "LP" do
    describe "#top" do
      it "正常なレスポンス" do
        get :top
        expect(response).to be_successful
      end

      it "200レスポンス" do
        get :top
        expect(response).to have_http_status "200"
      end
    end
  end
end
