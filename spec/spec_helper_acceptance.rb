require 'beaker-rspec'
require 'beaker-puppet'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'

run_puppet_install_helper unless ENV['BEAKER_provision'] == 'no'

RSpec.configure do |c|
  # Readable test descriptions
  c.formatter = :documentation

  c.before :suite do
    install_module
    install_module_dependencies
    hosts.each do |host|
      if fact('os.family') == 'RedHat'
        # EPEL provides rkhunter
        install_package(host, 'epel-release')
      end
    end
  end
end