json.extract! article, :id, :title, :body, :created_at, :updated_at, :topic_id
json.url article_url(article, format: :json)
