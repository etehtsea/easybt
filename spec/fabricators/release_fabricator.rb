Fabricator(:release) do
  title { Faker::Lorem.sentence }
  torrent { File.open(File.join(Rails.root, 'spec', 'support', 'files', 'demo.torrent')) }
end
