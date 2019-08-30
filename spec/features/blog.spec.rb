FactoryBot.define do

  factory :blog ,class:Blog do
    user
  end

  factory :user do
    uid = 8.times.map { SecureRandom.random_number(10) }.join
    provider = "twitter"
    name { 'test_user_01' }
    location {'北海道'}
    admin = true
    email { 'hoge@hoge.com' }
    password { 'valid_password' }
  end
end

# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "Blog管理機能", type: :feature do
  
  background do
    @user = FactoryBot.create(:user)
    @blog01 = FactoryBot.create(:blog, user_id: @user.id, title: "test_title01", content: "test_content_01")
    @blog02 = FactoryBot.create(:blog, user_id: @user.id, title: "test_title02", content: "test_content_02")
  end

  scenario "blog一覧のテスト" do
    visit root_path
    click_on 'blog'
    expect(page).to have_content 'test_title01'
    expect(page).to have_content 'test_title02'
  end

  describe "管理者以外がblogを編集・削除できないテスト" do
  
    before do
      OmniAuth.config.mock_auth[:twitter] = nil
      Rails.application.env_config['omniauth.auth'] = twitter_mock
      visit root_path
      click_link "ログイン"
    end

    it "一般ユーザがログインした状態でblog一覧ページに画面遷移できるかのテスト" do
      click_link "Sign in with Twitter"
      click_link "blog"
      expect(page).to have_content 'ブログ一覧'
    end

    it "一般ユーザがログインした状態でblogの編集ができないテスト" do
      click_link "Sign in with Twitter"
      click_link "blog"
      expect(page).to_not have_content '編集'
    end
  end
end