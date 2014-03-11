current_dir = File.dirname(__FILE__)

log_level                 :info
log_location              STDOUT
node_name                 "kforsthoevel"
client_key                "#{ENV['HOME']}/.ssh/chef_kforsthoevel.pem"
validation_client_name    "injixo-validator"
validation_key            "#{ENV['HOME']}/.ssh/chef_injixo-validator.pem"
chef_server_url           "https://api.opscode.com/organizations/injixo"
cache_type                'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path             ["#{current_dir}/../cookbooks"]
role_path                 "#{current_dir}/../roles"
cookbook_email            "Kai Forsthoevel <kai.forsthoevel@injixo.com>"

knife[:aws_ssh_key_id]        = ENV['AWS_SSH_KEY']
knife[:aws_access_key_id]     = ENV['AWS_ACCESS_KEY_ID']
knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']
knife[:region]                = ENV['AWS_DEFAULT_REGION']
