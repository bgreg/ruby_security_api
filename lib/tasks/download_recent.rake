namespace :db do
  desc "Download Newest exposure data"
  task download_recent: :environment do
    include ExposureLoader
    download_recent
  end
end

