require 'chef/knife/cookbook_create'

class Chef
  class Knife
    class CookbookCreate
      alias_method :old_run, :run
      def run
        old_run

        cookbook_path = File.expand_path(Array(config[:cookbook_path]).first)
        cookbook_name = @name_args.first
        create_specs(cookbook_path, cookbook_name)
        create_spec_helper(cookbook_path, cookbook_name)
        create_default_spec(cookbook_path, cookbook_name)
      end

      def create_specs(dir, cookbook_name)
        msg("** Creating specs for cookbook: #{cookbook_name}")
        FileUtils.mkdir_p(File.join(dir, cookbook_name, 'spec', 'recipes'))
      end

      def create_spec_helper(dir, cookbook_name)
        helper = File.join(dir, cookbook_name, 'spec', 'spec_helper.rb')
        newlines = File.exists?(helper) ? "\n\n" : ''

        unless File.exists?(helper) && File.read(helper).include?('chefspec')
          File.open(helper, 'a') do |file|
            file.write <<-EOH
#{newlines}# Added by ChefSpec
require 'chefspec'

# Uncomment to use ChefSpec's Berkshelf extension
# require 'chefspec/berkshelf'

RSpec.configure do |config|
  # Specify the path for Chef Solo to find cookbooks
  # config.cookbook_path = '/var/cookbooks'

  # Specify the path for Chef Solo to find roles
  # config.role_path = '/var/roles'

  # Specify the Chef log_level (default: :warn)
  # config.log_level = :debug

  # Specify the path to a local JSON file with Ohai data
  # config.path = 'ohai.json'

  # Specify the operating platform to mock Ohai data from
  # config.platform = 'ubuntu'

  # Specify the operating version to mock Ohai data from
  # config.version = '12.04'
end
EOH
          end
        end
      end

      def create_default_spec(dir, cookbook_name)
        spec_recipes = File.join(dir, cookbook_name, 'spec', 'recipes')
        spec = File.join(spec_recipes, 'default_spec.rb')

        unless File.exists?(spec)
          File.open(spec, 'w') do |file|
            file.write <<-EOH
require_relative '../spec_helper'

describe '#{cookbook_name}::default' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  # Write quick specs using `it` blocks with implied subjects
  it { should do_something('...') }

  # Write full examples using the `expect` syntax
  it 'does something' do
    expect(subject).to do_something('...')
  end

  # Use an explicit subject
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'does something' do
    expect(chef_run).to do_something('...')
  end
end
EOH
          end
        end
      end
    end
  end
end
