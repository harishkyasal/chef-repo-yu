default[:jenkins][:jenkins_user]    = 'appa'
default[:jenkins][:jenkins_base]    = '/usr/local/jenkins'
default[:jenkins][:jenkins_home]    = '/usr/local/jenkins/JENKINS_HOME'
default[:jenkins][:jenkins_url]     = 'http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war'
default[:jemkins][:use_jetty]       = true
default[:jenkins][:http_port]       = "8888"
default[:jenkins][:ajp_port]        = "8809"
default[:jenkins][:custom_plugins]  = { }