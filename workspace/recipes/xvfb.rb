include_recipe 'xvfb'

template '/etc/profile.d/xvfb.sh' do
  source  'xvfb.sh.erb'
  owner   'root'
  mode    0755
end
