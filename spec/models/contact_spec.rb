require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "validation" do
    describe "正しいお問い合わせ情報" do
      it "基本" do
        foo = Contact.new(name: "foo",email: "foo@foo.com", message: "foo1234")
        expect(foo.valid?).to eq true
      end
  
      it "正しい投稿情報(emailに大文字が入っている)" do
        foo = Contact.new(name: "foo",email: "FoO@fOo.CoM", message: "foo1234")
        expect(foo.valid?).to eq true
      end
    end

    describe "間違ったユーザー情報" do

      it "名前が無い" do
        bar = Contact.new(email: "FoO@fOo.CoM", message: "foo1234")
        expect(bar.valid?).to eq false
      end
  
      it "名前が長すぎる" do
        bar_name= "a" * 51
        bar = Contact.new(name: bar_name,email: "FoO@fOo.CoM", message: "foo1234")
        expect(bar.valid?).to eq false
      end
      
      it "emailが無い" do
        bar = Contact.new(name: "bar", message: "foo1234")
        expect(bar.valid?).to eq false
      end

      it "emailが不正" do
        bar = Contact.new(name: "bar",email: "bar", message: "foo1234")
        expect(bar.valid?).to eq false
      end
  
      it "コンテンツが無い" do
        bar =  Contact.new(name: "bar",email: "bar@bar.com")
        expect(bar.valid?).to eq false
      end
    end

  end
end
