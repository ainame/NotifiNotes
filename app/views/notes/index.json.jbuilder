json.array!(@notes) do |note|
  json.extract! note, :id, :title, :body, :user_id, :category_id
  json.url note_url(note, format: :json)
end
