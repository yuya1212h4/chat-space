require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }
  config.storage = :fog

    case Rails.env
    when 'development'
        config.fog_directory  = 'sample-test-yuya1212'
        config.asset_host = 'https://s3.amazonaws.com/sample-test-yuya1212'
    when 'production'
        config.fog_directory  = 'sample-test-yuya1212'
        config.asset_host = 'https://s3.amazonaws.com/sample-test-yuya1212'
    end
end
