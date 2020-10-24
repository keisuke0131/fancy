require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    describe "正しいユーザ情報" do
      it "基本" do
        foo = User.new(name: "foo" , email: "foo@foo.com", password: "foo1234")
        expect(foo.valid?).to eq true
      end
  
      it "正しいユーザー情報(emailに大文字が入っている)" do
        foo = User.new(name: "foo" , email: "FOO@fOo.Com", password: "foo1234")
        expect(foo.valid?).to eq true
      end
    end

    describe "間違ったユーザー情報" do
      it "名前が無い" do
        bar = User.new(email: "bar", password: "bar1234")
        expect(bar.valid?).to eq false
      end
  
      it "名前が長すぎる" do
        bar_name= "a" * 51
        bar = User.new(name: bar_name , email: "bar", password: "bar1234")
        expect(bar.valid?).to eq false
      end
    
      it "emailが不正" do
        bar = User.new(name: "bar" , email: "bar", password: "bar1234")
        expect(bar.valid?).to eq false
      end
  
      it "パスワードが短い" do
        bar_name= "a" * 51
        bar = User.new(name: bar_name , email: "bar", password: "1234")
        expect(bar.valid?).to eq false
      end
    end

  end
end
