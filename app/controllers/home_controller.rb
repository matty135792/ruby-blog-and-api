# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @articles = Article.all
    @recent_articles = Article.most_recent
    @topics = Topic.all
  end
end
