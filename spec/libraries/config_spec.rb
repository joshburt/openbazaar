require_relative '../spec_helper.rb'
require_relative '../../libraries/config_helper.rb'

describe 'OpenBazaar::ConfigHelper' do


  context 'databag_exists? tests' do
    include OpenBazaar::ConfigHelper

    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

    before do
      allow(Chef::DataBag).to receive(:list).and_return({ 'dev_ob' => { 'ob' => {}, 'ob_secrets' => {}}, 'test_ob' => {} })
      allow(Chef::DataBag).to receive(:load).with('dev_ob').and_return({ 'ob' => {}, 'ob_secrets' => {} })
      allow(Chef::DataBag).to receive(:load).with('test_ob').and_return( {} )
    end

    it 'returns true if we defined the data bag' do
      expect(Chef::DataBag.list.key?('dev_ob')).to be true
    end

    it 'returns false if we did not define the data bag' do
      expect(Chef::DataBag.list.key?('ob_blah')).to be false
    end

    it 'returns true when the data bag item exists' do
      expect(databag_exists?('dev_ob', 'ob')).to be true
    end

    it 'returns false when the data bag item does not exists' do
      expect(databag_exists?('dev_ob', 'ob_blah')).to be false
    end

    it 'returns false when the data bag does not exists' do
      expect(databag_exists?('test_ob', 'ob')).to be false
    end
  end
  # stub_data_bag('dev_ob').and_return(['ob', 'ob_secrets'])
end
