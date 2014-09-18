require 'exposure_loader'

namespace :db do
  desc "Download all exposure data"
  task download_all: :environment do
    include ExposureLoader
    download_all
  end
end
