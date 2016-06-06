default["apache"]["sites"]["shyman10002"] = { "site_title" => "Scotts websites coming soon", "port" => 80, "domain" => "shyman10002.mylabserver.com" }
default["apache"]["sites"]["shyman10002b"] = { "site_title" => "Scotts2b website is coming soon", "port" => 80, "domain" => "shyman10002b.mylabserver.com" }
default["apache"]["sites"]["shyman10001"] = { "site_title" => "Scott3 website", "port" => 80, "domain" => "shyman10001.mylabserver.com" } 

case node["platform"]
when "centos"
	default["apache"]["package"] = "httpd"
when "ubuntu"
	default["apache"]["package"] = "apache2"
end
