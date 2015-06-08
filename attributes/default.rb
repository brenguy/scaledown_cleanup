#sets the url of your chef server amongst other things...
default['chef']['url'] = #fill in chef server api url
default['chef']['client_key'] = '/etc/chef/client.pem'
default['chef']['validation_client_name'] = 'chef-validator'
default['chef']['validation_key'] = '/etc/chef/validator.pem'
default['virtualization_type'] = #'hvm' or 'pv'
default['systemd'] = #true or false


