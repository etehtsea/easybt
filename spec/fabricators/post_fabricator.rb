Fabricator(:post) do
  title { Fabricate.sequence(:title, 1) { |i| "Post ##{i}" } }
end
