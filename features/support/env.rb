require 'cucumber'
require 'aruba/cucumber'

require 'chef/config'

Before do
  write_knife_rb
end

def write_knife_rb
  root = File.expand_path(File.join(*@dirs))
  FileUtils.mkdir_p(root)

  set_env 'KNIFE_HOME', root

  knife_rb = File.join(root, 'knife.rb')
  File.open(knife_rb, 'w') do |file|
    file.write <<-EOH
cookbook_path '#{File.expand_path(root)}'
EOH
  end
end
