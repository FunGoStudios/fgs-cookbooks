package "build-essential"
#to remove package installed from source
package "checkinstall"
package "postgresql-9.1"
package "postgresql-server-dev-9.1"
package "libxml2-dev"
package "proj"
package "libproj-dev"
package "libjson0-dev"
package "xsltproc"
package "docbook-xsl"
package "docbook-mathml"
package "gettext"
package "postgresql-contrib-9.1"
package "pgadmin3"
package "libgdal-dev" do
  only_if {node[:postgis][:raster]}
end
package "swig"
package "python2.7-dev"
package "imagemagick"


#Download and compile postgis 2 in default location
#HOWTO Install from source http://stackoverflow.com/questions/8530593/chef-install-and-update-programs-from-source

remote_file "#{Chef::Config[:file_cache_path]}/postgis-2.0.1.tar.gz" do
  source "http://www.postgis.org/download/postgis-2.0.1.tar.gz"
  checksum "32d181bbf0e648fe31c95b3dd23f7e4e49094d93cb4278fdf71c8feed4e9593c"
end

bash "install_postgis_from_source" do
  not_if do 
    `dpkg-query -W -f='${Status} ${Version}\n' postgis` == "install ok installed 2.0.1-1\n"
  end
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar -zxf #{Chef::Config[:file_cache_path]}/postgis-2.0.1.tar.gz
    (cd postgis-2.0.1/ && ./configure #{node[:postgis][:raster] ? "--with-raster" : "--without-raster"} && make && checkinstall)
    (cd /tmp/postgis-2.0.1/extensions && make && make install)
  EOH
end
