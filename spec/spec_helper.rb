require 'rspec'
require 'chef/knife/cookbook_create_extension'

RSpec.configure do |config|
  config.before(:each) do
    FileUtils.rm_rf(File.join('tmp', 'cookbooks'))
  end
end
