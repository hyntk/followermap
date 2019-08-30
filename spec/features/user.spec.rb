require 'rails_helper'

FactoryBot.define do

  factory :user do
    uid = 8.times.map { SecureRandom.random_number(10) }.join
    provider = "twitter"
    name { 'test_user_01' }
    location {'北海道'}
    admin = false
    email { 'hoge@hoge.com' }
    password { 'valid_password' }
  end

  factory :second_user,class: User do
    uid = 8.times.map { SecureRandom.random_number(10) }.join
    provider = "twitter"
    name { 'test_user_01' }
    location {'沖縄'}
    admin = false
    email { 'hoge@hoge.com' }
    password { 'valid_password' }
  end
end

RSpec.feature "ユーザー登録機能", type: :feature do

  describe "UserFeature" do

    describe "Twitter連携でサインアップする" do
  
      before do
        OmniAuth.config.mock_auth[:twitter] = nil
        Rails.application.env_config['omniauth.auth'] = twitter_mock
        visit root_path
        click_link "ログイン"
      end
  
      it "サインアップするとユーザーが増える" do
        expect{
          click_link "Sign in with Twitter"
        }.to change(User, :count).by(1)
      end
  
      it "すでに連携されたユーザーがサインアップしようとするとユーザーは増えない" do
        click_link "Sign in with Twitter"
        click_link "ログアウト"
        click_link "ログイン"
        expect{
          click_link "Sign in with Twitter"
        }.not_to change(User, :count)
      end
  

      it "マイページに画面遷移できるかのテスト" do
        click_link "Sign in with Twitter"
        click_link "マイページ"
        save_and_open_page
        expect(page).to have_content 'ユーザー詳細画面'
      end
    end
  end
  
end  