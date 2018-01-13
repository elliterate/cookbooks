volume_options = node['workspace']['volume']

if volume_options
  directory volume_options['mount_point'] do
    recursive true
  end

  [:enable, :mount].each do |mount_action|
    mount volume_options['mount_point'] do
      action mount_action
      device volume_options['device']
      dump 0
      fstype volume_options['fstype']
      options ['defaults', 'discard', 'nofail']
      pass 0
    end
  end
end
