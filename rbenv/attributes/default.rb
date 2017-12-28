# git repository containing rbenv
default['rbenv']['git_url'] = 'https://github.com/rbenv/rbenv.git'
default['rbenv']['git_ref'] = 'master'

# a list of user hashes, each an isolated per-user rbenv installation
default['rbenv']['user_installs'] = []

# git repository containing ruby-build
default['ruby-build']['git_url'] = 'https://github.com/rbenv/ruby-build.git'
default['ruby-build']['git_ref'] = 'master'
