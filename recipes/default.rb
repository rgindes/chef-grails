include_recipe 'yum-gd'
include_recipe 'java'
include_recipe 'ark'

remote_file '/opt/grails-3.0.3.zip' do
  source 'https://github.com/grails/grails-core/releases/download/v3.0.3/grails-3.0.3.zip'
end

execute 'unpack grails' do
  cwd '/opt'
  command 'unzip grails-3.0.3.zip'
end

bash 'set GRAILS_HOME and JAVA_HOME' do
  code <<-EOH
    mv /opt/grails-3.0.3 /opt/grails
    export GRAILS_HOME=/opt/grails
    export JAVA_HOME=/usr
    export PATH=$PATH:$GRAILS_HOME/bin
    EOH
end

template '/etc/profile.d/grails_java_home.sh' do
	source 'grails_java_home.sh'
end
