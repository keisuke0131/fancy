require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#index" do
    include SessionsHelper
    before do
      @user = User.new(
        name: "sample_user",
        email: "sample@sample.com",
        password: "fancy0714",
        password_confirmation: "fancy0714",
        admin: false,
        activation_digest: "$2a$12$jNbVBjaz0aRD5mY/di.2m.CFTBbBNllu/EOY45/dVtvCz4lyX.5Xi",
        activated: true,
        activated_at: "2020-10-15 02:32:43"
      )
      log_in(@user)
    end

    it "正常なレスポンス" do
      get :index
      expect(response).to be_successful
    end

    it "200レスポンス" do
      get :index
      expect(response).to have_http_status "200"
    end
  end
end