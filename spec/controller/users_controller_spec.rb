require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "user" do
    include SessionsHelper
    let(:user) { 
      User.create(
        name: "sample_user",
        email: "sample@sample.com",
        password: "fancy0714",
        password_confirmation: "fancy0714",
        admin: true,
        activation_digest: "$2a$12$jNbVBjaz0aRD5mY/di.2m.CFTBbBNllu/EOY45/dVtvCz4lyX.5Xi",
        activated: true,
        activated_at: "2020-10-15 02:32:43"
      )
    }

    before do
      log_in(user)
    end

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

    describe "#index" do
      it "正常なレスポンス" do
        get :index
        expect(response).to be_successful
      end

      it "200レスポンス" do
        get :index
        expect(response).to have_http_status "200"
      end
    end

    describe "#setting" do
      it "正常なレスポンス" do
        get :setting
        expect(response).to be_successful
      end

      it "200レスポンス" do
        get :setting
        expect(response).to have_http_status "200"
      end
    end

    describe "#vaild_wait" do
      it "正常なレスポンス" do
        get :vaild_wait
        expect(response).to be_successful
      end

      it "200レスポンス" do
        get :vaild_wait
        expect(response).to have_http_status "200"
      end
    end

    describe "#admin" do
      it "正常なレスポンス" do
        get :admin
        expect(response).to be_successful
      end

      it "200レスポンス" do
        get :admin
        expect(response).to have_http_status "200"
      end
    end

  end
end
