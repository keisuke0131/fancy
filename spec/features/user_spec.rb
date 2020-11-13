require 'rails_helper'

feature 'user', type: :feature do
  include SessionsHelper

  let(:user) { 
    User.create(
      name: "sample_user",
      email: "sample@sample.com",
      password: "fancy0714",
      password_confirmation: "fancy0714",
      admin: false,
      activation_digest: "$2a$12$jNbVBjaz0aRD5mY/di.2m.CFTBbBNllu/EOY45/dVtvCz4lyX.5Xi",
      activated: true,
      activated_at: "2020-10-15 02:32:43"
    )
  }

  let(:admin) { 
    User.create(
      name: "admin_user",
      email: "admin@admin.com",
      password: "fancy0714",
      password_confirmation: "fancy0714",
      admin: true,
      activation_digest: "$2a$12$jNbVBjaz0aRD5mY/di.2m.CFTBbBNllu/EOY45/dVtvCz4lyX.5Xi",
      activated: true,
      activated_at: "2020-10-15 02:32:43"
    )
  }

  scenario '新規仮登録' do
    visit new_user_path
    fill_in 'user_name', with: '冨吉 桂介'
    fill_in 'user_email', with: 'fancy@fancy-jp.work'
    fill_in 'user_password', with: 'fancy0714'
    fill_in 'user_password_confirmation', with: 'fancy0714'
    click_on('登録する')
    expect(current_path).to eq vaild_wait_path
  end

  scenario 'ログイン' do
    visit login_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_on('ログイン')
    expect(current_path).to eq posts_steps_path
  end

  scenario 'ログインしてからLPにアクセス' do
    visit login_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_on('ログイン')
    expect(current_path).to eq posts_steps_path
    visit root_path
    expect(current_path).to eq posts_steps_path
  end

  scenario '管理者アカウントで管理画面アクセス' do
    visit login_path
    fill_in 'session_email', with: admin.email
    fill_in 'session_password', with: admin.password
    click_on('ログイン')
    expect(current_path).to eq posts_steps_path
    visit admin_path
    expect(current_path).to eq admin_path
  end

  scenario '非管理者アカウントで管理画面アクセス' do
    visit login_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_on('ログイン')
    expect(current_path).to eq posts_steps_path
    visit admin_path
    expect(current_path).to eq posts_steps_path
  end

end