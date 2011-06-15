Fabricator(:release) do
  title { Faker::Lorem.words(2) }
  torrent { File.open(File.join(Rails.root, 'spec', 'support', 'files', 'demo.torrent')) }
end
