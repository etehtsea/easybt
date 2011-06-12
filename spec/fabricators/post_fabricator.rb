Fabricator(:post) do
  title { Forgery::LoremIpsum.words(2) }
end
