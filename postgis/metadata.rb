maintainer       "Nicola Brisotto"
maintainer_email "nicolabrisotto@gmail.com"
license          "Apache 2.0"
description      "Installs Postgis from ppa"
version          "0.0.1"

%w{ ubuntu }.each do |os|
  supports os
end
