include_recipe 'nodejs'
include_recipe 'yarn'

# Ensure running the latest version of Node.js
if node['nodejs']['manage_node'] && node['nodejs']['install_method'].to_s == 'package'
  node['nodejs']['packages'].each do |node_pkg|
    package node_pkg do
      action :upgrade
    end
  end
end
