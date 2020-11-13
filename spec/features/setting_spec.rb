require 'rails_helper'

feature 'setting', type: :feature do
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
    #事前にログインする
    visit login_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_on('ログイン')
  end

  scenario 'メールアドレス変更' do
    visit change_email_edit_path(user.id)
    fill_in 'new_email', with: 'sample2@sample.com'
    fill_in 'password_confirmation', with: 'fancy0714'
    click_on('変更')
    expect(current_path).to eq posts_steps_path
  end

  scenario 'パスワード変更' do
    visit change_password_edit_path(user.id)
    fill_in 'current_password', with: 'fancy0714'
    fill_in 'new_password', with: 'Fancy0714'
    fill_in 'new_password_confirmation', with: 'Fancy0714'
    click_on('変更')
    expect(current_path).to eq posts_steps_path
  end

  scenario 'お問い合わせする' do
    visit contacts_path
    fill_in 'contact_name', with: '冨吉桂介'
    fill_in 'contact_email', with: 'sample@sample.com'
    fill_in 'contact_message', with: '只今テスト中'
    click_on '送信する'
    expect(current_path).to eq contacts_thanx_path
  end

  scenario 'ログアウトする' do
    visit setting_path
    click_link 'logout_btn'
    expect(current_path).to eq root_path
  end

end