require 'rails_helper'

RSpec.describe Blog, type: :model do
  # 各テストの前にblogを作成
  # before do
  #   @blog = Blog.create(
  #     title: "SampleBlog01",
  #     content: "SampleBlog01のcontent01",
  #     user_id: "1"
  #   )
  #   @other_blog = Blog.create(
  #     title: "SampleBlog02",
  #     content: "SampleBask02のcontent02",
  #     user_id: "1"
  #   )
  # end

  it "contentが空ならバリデーションが通らない" do
    blog = Blog.new(title: 'SampleBlog01' ,content: '')
    #expect(blog).not_to be_valid は、「blog が妥当（valid）ではないことを期待する」という意味
    expect(blog).not_to be_valid
  end

  it "titleが空ならバリデーションが通らない" do
    blog = Blog.new(title: '' ,content: 'SampleBlog01のcontent01')
    #expect(blog).not_to be_valid は、「blog が妥当（valid）ではないことを期待する」という意味
    expect(blog).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    # ここに内容を記載する
    blog = Blog.new(title: 'SampleBlog01' ,content: 'SampleBlog01のcontent01')
  end

end