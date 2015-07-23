include_recipe 'yum-gd'
include_recipe 'java'
include_recipe 'ark'

ark 'grails' do 
  path "#{node['grails']['grails_home']}/grails.zip"
  url node['grails']['install_url']
end

bash 'set GRAILS_HOME and JAVA_HOME' do
  code <<-EOH
    export GRAILS_HOME=#{node['grails']['grails_home']}/grails
    export JAVA_HOME=/#{node['grails']['java_home']}
    export PATH=$PATH:$GRAILS_HOME/bin
    EOH
end

template '/etc/profile.d/grails_java_home.sh' do
	source 'grails_java_home.sh.erb'
end
