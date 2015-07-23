require_relative 'spec_helper'

describe file('/opt/grails') do
  it { should be_directory }
end

describe file('/etc/profile.d/grails_java_home.sh') do
  it { should exit }
end
