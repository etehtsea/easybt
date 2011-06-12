Fabricator(:release) do
  title { sequence(:release_title, 1) { |i| "Release ##{i}" } }
  torrent { File.open(File.join(Rails.root, 'spec', 'support', 'files', 'demo.torrent')) }
end
