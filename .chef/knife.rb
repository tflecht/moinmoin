# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "tflecht"
client_key               "#{current_dir}/tflecht.pem"
validation_client_name   "abstractrage-validator"
validation_key           "#{current_dir}/abstractrage-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/abstractrage"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

knife[:aws_ssh_key_id] = 'awshosts'
knife[:aws_access_key_id] = 'AKIAIFRFQBG2NOAQOSAQ'
knife[:aws_secret_access_key] = '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'
knife[:region] = 'us-west-2'
knife[:availability_zone] = 'us-west-2c'
