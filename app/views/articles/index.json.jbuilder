
json.array! @articles do |article|
     json.( article, :id, :title, :body)
     json.url url_for(article)     #url_for is a rails method
end