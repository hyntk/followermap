FactoryBot.define do

  factory :map ,class:Map do
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
RSpec.feature "Map管理機能", type: :feature do

  describe "MapFeature" do

    describe "Twitter連携でサインアップする" do
  
      before do
        OmniAuth.config.mock_auth[:twitter] = nil
        Rails.application.env_config['omniauth.auth'] = twitter_mock
        visit root_path
        click_link "ログイン"
      end

      it "Mapページに画面遷移できるかのテスト" do
        click_link "Sign in with Twitter"
        expect(page).to have_content 'Map'
      end
    end
  end
end