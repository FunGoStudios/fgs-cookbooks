#apt_repository 'sharpie-for-science' do
#  uri 'http://ppa.launchpad.net/sharpie/for-science/ubuntu'
#  distribution node['lsb']['codename']
#  components ['main']
#  keyserver 'keyserver.ubuntu.com'
#  key 'DAF764E2'
#end
#
#apt_repository 'sharpie-postgis-stable' do
#  uri 'http://ppa.launchpad.net/sharpie/postgis-stable/ubuntu'
#  distribution node['lsb']['codename']
#  components ['main']
#  keyserver 'keyserver.ubuntu.com'
#  key 'DAF764E2'
#end

apt_repository 'ubuntugis-ubuntugis-unstable' do
  action :add
  uri 'http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu'
  distribution node['lsb']['codename']
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key '314DF160'
end


##up-to-date GDAL support for Precise
apt_repository 'olivier-berten-geo-ubuntu' do
  action :remove
  uri 'http://ppa.launchpad.net/olivier-berten/geo/ubuntu'
  distribution node['lsb']['codename']
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key 'B4A9892F'
end

execute "apt-get update" do
  ignore_failure true
  action :run
end
