require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validation" do
    describe "正しい投稿情報" do
      it "基本" do
        foo = Post.new(title: "foo" , step: 1, content: "<h1>foo1234</h1>")
        expect(foo.valid?).to eq true
      end
    end

    describe "間違った投稿情報" do
      it "名前が無い" do
        bar = Post.new(step: 1, content: "<h1>foo1234</h1>")
        expect(bar.valid?).to eq false
      end
    
      it "stepが無い" do
        bar = Post.new(title: "bar" ,content: "<h1>foo1234</h1>")
        expect(bar.valid?).to eq false
      end
  
      it "コンテンツが無い" do
        bar_name= "a" * 51
        bar = Post.new(title: "bar" , step: 1)
        expect(bar.valid?).to eq false
      end
    end

  end
end
