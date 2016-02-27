json.array!(@steps) do |step|
  json.extract! step, :id, :name, :form
  json.url step_url(step, format: :json)
end
