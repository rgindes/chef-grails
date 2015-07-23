# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'grails::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
    end.converge(described_recipe)
  end

  it 'uses ark to download and unpack grails' do
    expect(chef_run).to put_ark('grails').with(
      path: "#{node['grails']['grails_home']}/grails.zip"
      url: node['grails']['install_url'])
  end

  it 'sets path and home environment variables with bash' do
    expect(chef_run).to run_bash('set GRAILS_HOME and JAVA_HOME')
  end

  it 'drops profile.d template to re-set environment variables' do
    expect(chef_run).to create_template('/etc/profile.d/grails_java_home.sh')
  end
end