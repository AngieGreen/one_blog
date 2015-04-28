CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJGQPV5OL6DMGSMYA',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'us-west-2'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = '52apps'                     # required
end