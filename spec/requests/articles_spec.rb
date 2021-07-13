require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /articles" do
    it "works! (now write some real specs)" do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end
  describe "get articles_path" do
    it "renders the index view" do
      FactoryBot.create_list(:article, 10)
      get articles_path
      expect(response).to render_template(:index)
    end
  end
  describe "get article_path" do
    it "renders the :show template" do
      article = FactoryBot.create(:article)
      get article_path(id: article.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the index path if the article id is invalid" do
      get article_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to articles_path
    end
  end
  describe "get new_article_path" do
    it "renders the :new template" do
      article = FactoryBot.create(:article)
      get new_article_path
      expect(response).to render_template(:new)
    end
  end
  describe "get edit_article_path" do
    it "renders the :edit template" do
      article = FactoryBot.create(:article)
      get edit_article_path(id: article.id)
      expect(response).to render_template(:edit)
    end
  end
  describe "post articles_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      article_attributes = FactoryBot.attributes_for(:article)
      expect { post articles_path, params: {article: article_attributes}
    }.to change(Article, :count)
      expect(response).to redirect_to article_path(id: Article.last.id)
    end
  end
  describe "post articles_path with invalid data" do
    it "does not save a new entry or redirect" do
      article_attributes = FactoryBot.attributes_for(:article)
      article_attributes.delete(:title)
      expect { post articles_path, params: {article: article_attributes}
    }.to_not change(Article, :count)
      expect(response).to render_template(:new)
    end
  end
  describe "put article_path with valid data" do
    it "updates an entry and redirects to the show path for the article" do
      article = FactoryBot.create(:article)
      put article_path(id: article.id),   params: {article: {title: "My article"}}
      article.reload
      expect(article.title).to eq("My article")
      expect(response).to redirect_to article_path(id: article.id)
    end
  end
  describe "put article_path with invalid data" do
    it "does not update the article record or redirect" do
      article = FactoryBot.create(:article)
      put article_path(article.id), params: {article: {title: "b"}}
      article.reload
      expect(article.title).not_to eq("b")
      expect(response).to render_template(:edit) 
    end


  end
  describe "delete a article record" do
    it "deletes a article record" do
      article = FactoryBot.create(:article)
      delete article_path(id: article.id)
      expect(response).to redirect_to articles_path
    end
  end
end
