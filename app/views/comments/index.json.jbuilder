
json.array! @comments do |comment|
     json.( comment, :id, :commenter, :body)
     json.url article_comments_path(comment.article, comment)     #url_for is a rails method
end