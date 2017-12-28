template '/etc/profile.d/rbenv.sh' do
  source  'rbenv.sh.erb'
  owner   'root'
  mode    0755
end
