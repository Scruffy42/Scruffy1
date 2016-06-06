# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "shyman1000"
client_key               "#{current_dir}/shyman1000.pem"
validation_client_name   "la_org-validator"
validation_key           "#{current_dir}/la_org-validator.pem"
chef_server_url          "https://api.chef.io/organizations/la_org"
cookbook_path            ["#{current_dir}/../cookbooks"]
