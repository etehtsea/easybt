Fabricator(:release) do
  title { Faker::Lorem.word }
  torrent { File.open(File.join(Rails.root, 'spec', 'support', 'files', 'demo.torrent')) }
end
