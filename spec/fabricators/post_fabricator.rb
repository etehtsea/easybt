Fabricator(:post) do
  title { sequence(:post_title, 1) { |i| "Post ##{i}" } }
end
