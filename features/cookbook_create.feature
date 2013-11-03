Feature: Creating a cookbook with knife-spec installed
  As a Chef user
  I want to create cookbooks with specs
  So I have nice test stubs

  Scenario: Foo
    * I run `knife cookbook create myface`
    * the output should contain:
      """
      ** Creating cookbook myface
      ** Creating README for cookbook: myface
      ** Creating CHANGELOG for cookbook: myface
      ** Creating metadata for cookbook: myface
      ** Creating specs for cookbook: myface
      """
    * a file named "myface/spec/spec_helper.rb" should exist
    * the file "myface/spec/spec_helper.rb" should contain:
      """
      # Added by ChefSpec
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
      """
    * a file named "myface/spec/recipes/default_spec.rb" should exist
    * the file "myface/spec/recipes/default_spec.rb" should contain:
      """
      require_relative '../spec_helper'

      describe 'myface::default' do
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
      """

