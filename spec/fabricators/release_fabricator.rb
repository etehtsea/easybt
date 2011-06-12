Fabricator(:release) do
  title { Forgery::LoremIpsum.words(2) }
  torrent { File.open(File.join(Rails.root, 'spec', 'support', 'files', 'demo.torrent')) }
end
