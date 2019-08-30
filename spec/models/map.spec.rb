require 'rails_helper'

RSpec.describe Blog, type: :model do


  it "followernameが空ならバリデーションが通らない" do
    map = Map.new(followername: '' ,followerlocation: '北海道')
    #expect(blog).not_to be_valid は、「blog が妥当（valid）ではないことを期待する」という意味
    expect(map).not_to be_valid
  end

  it "followerlocationが空ならバリデーションが通る" do
    map = Map.new(followername: 'Samplefollower01' ,followerlocation: '')
  end

  it "followernameとcontentに内容が記載されていればバリデーションが通る" do
    # ここに内容を記載する
    map = Map.new(followername: 'Samplefollower01' ,followerlocation: '北海道')
  end
end