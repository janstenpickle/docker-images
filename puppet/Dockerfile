FROM ubuntu:12.04

ADD http://apt.puppetlabs.com/puppetlabs-release-precise.deb puppetlabs-release-precise.deb
RUN dpkg -i puppetlabs-release-precise.deb
RUN apt-get install -y puppet
ADD facter/default_gateway.rb  /usr/lib/ruby/1.8/facter/default_gateway.rb
