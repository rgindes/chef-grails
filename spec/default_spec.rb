# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'grails::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
    end.converge(described_recipe)
  end

  it 'downloads grails' do
  	expect(chef_run).to create_remote_file('/opt/grails-3.0.3.zip').with(
  		url: node['grails']['install_url'])
  end

  it 'unzips grails' do
  	expect(chef_run).to run_execute('unpack grails').with(
  		command: 'unzip grails-3.0.3.zip')
  end
end