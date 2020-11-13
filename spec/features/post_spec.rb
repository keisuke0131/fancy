require 'rails_helper'

feature 'post', type: :feature do
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

  background do
    visit login_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_on('ログイン')
  end

  def new_post_method
    visit new_post_path
    fill_in 'post_title', with: 'test'
    fill_in 'post_step', with: 1
    attach_file "post_image", "spec/image/test_image.png"
    fill_in 'post_content', with: '<h1>test</h1>'
    click_on('投稿する')
    expect(current_path).to eq posts_steps_path
  end

  scenario '新規投稿' do
    new_post_method
  end

  scenario '投稿閲覧' do
    new_post_method
    visit posts_steps_path
    visit post_path(1)
  end

  scenario '投稿編集（タイトル変更）' do
    new_post_method
    visit edit_post_path(1)
    fill_in 'post_title', with: 'テスト'
    click_on('投稿する')
    expect(current_path).to eq posts_steps_path
    visit post_path(1)
    @post = Post.find(1)
    expect(@post.title).to eq 'テスト'
  end

  scenario '投稿削除' do
    new_post_method
    visit edit_post_path(1)
    click_link('delete_btn')
    expect(current_path).to eq posts_steps_path
  end

  # scenario 'お気に入り追加' do
  #   new_post_method
  #   visit posts_path(1)
  #   page.assert_selector("[id='like-button-1']").click
  #   # page.first(".like-btn").click
  #   expect(like.find(user_id: 100,post_id: 1)).to eq true
  # end

end