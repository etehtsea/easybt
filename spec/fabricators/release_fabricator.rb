Fabricator(:release) do
  title { sequence(:release_title, 1) { |i| "Release ##{i}" } }
end
