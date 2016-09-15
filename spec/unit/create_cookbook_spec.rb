require 'spec_helper'

describe Chef::Knife::CookbookCreate do
  let(:name)     { 'myface' }
  let(:knife)    { described_class.new }
  let(:spec_dir) { File.join('tmp', 'cookbooks', name, 'spec') }

  before do
    # Do not run the existing cookbook_create commands
    allow_any_instance_of(described_class).to receive(:old_run)

    # Setup the configuration
    knife.config = { cookbook_path: 'tmp/cookbooks' }
    knife.name_args = [name]

    # Tell knife to shutup
    allow(knife).to receive(:msg)
  end

  describe 'run' do
    before { knife.run }

    it 'calls the old_run action' do
      expect(knife).to receive(:old_run).once
      knife.run
    end

    it 'creates the specs directory' do
      expect(File.directory?('tmp/cookbooks/myface/spec')).to be_truthy
    end

    it 'creates the spec_helper' do
      path = File.join(spec_dir, 'spec_helper.rb')
      expect(File.exists?(path)).to be_truthy
    end

    it 'creates the default_spec' do
      path = File.join(spec_dir, 'recipes', 'default_spec.rb')
      expect(File.exists?(path)).to be_truthy
    end
  end
end
