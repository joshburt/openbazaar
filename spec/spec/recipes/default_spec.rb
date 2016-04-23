require_relative '../spec_helper.rb'

describe 'openbazaar::default' do
  let(:chef_run) {
    ChefSpec::SoloRunner.converge(described_recipe)
  }

  it 'includes the git cookbook' do
    expect(chef_run).to include_recipe('git::default')
  end
end
