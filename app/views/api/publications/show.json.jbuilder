json.partial!("pub", pub: @pub)

json.stories do
  json.array!(@pub.stories) do |story|
    json.partial! 'api/stories/story', story: story
  end
end
