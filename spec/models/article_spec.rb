require 'rails_helper'

RSpec.describe Article, type: :model do
  it "tests that factory is valid" do
    article = FactoryBot.build(:article)
    expect(article).to be_valid
  end

  it "has an invalid title" do
    article = FactoryBot.build(:article, title: '')
    expect(article).to_not be_valid
    expect(article.errors[:title]).to include("can't be blank")
  end

  it "has an invalid content" do
    article = build(:article, content: '')
    expect(article).to_not be_valid
  end

  it "has a unique slug" do
    article_one = create(:article, slug: 'fake slug') 
    article_two = build(:article, slug: 'fake slug')
    expect(article_one).to be_valid
    expect(article_two).to_not be_valid
  end 

end
