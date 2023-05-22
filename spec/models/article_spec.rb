require 'rails_helper'

RSpec.describe Article, type: :model do

  describe "#validations" do 
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
  describe '.recent' do 
    it 'return articles in the correct order' do
      older_article = create(:article, created_at: 1.hour.ago)
      recent_article = create(:article)
      expect(described_class.recent).to eq(
        [recent_article, older_article]
      )

      recent_article.update_column(:created_at, 2.hours.ago)
      expect(described_class.recent).to eq(
        [older_article, recent_article]
      )
    end
  end
end
