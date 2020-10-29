require 'rails_helper'

feature 'post', type: :feature do
  let(:user) { create(:user) }

  scenario '新規登録からログイン' do
    visit new_user_path
    expect(page).to have_no_content('new post')

    # ログインすると投稿ボタンが表示される
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on("Log in")
    expect(current_path).to eq root_path
    expect(page).to have_content('new post')

    # 投稿ボタンから記事を投稿する
    expect {
      click_on("new post")
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: "記事のタイトル"
      fill_in 'post_text', with: "記事の本文"
      click_on("投稿")
    }.to change{ Post.count }.by(1)
  end
end