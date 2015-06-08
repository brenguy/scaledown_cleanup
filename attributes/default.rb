#sets the url of your chef server
default['scaledown_cleanup']['chef']['url'] = "" #your chef url
default['scaledown_cleanup']['chef']['client_key'] = '/etc/chef/client.pem'
default['scaledown_cleanup']['chef']['validation_client_name'] = 'chef-validator'
default['scaledown_cleanup']['chef']['validation_key'] = '/etc/chef/validator.pem'
default['scaledown_cleanup']['virtualization_type'] = 'hvm'
default['scaledown_cleanup']['systemd'] = true


