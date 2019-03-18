require 'spec_helper'

describe 'rkhunter', type: :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      it do
        is_expected.to contain_class('rkhunter::packages')
      end

      it do
        is_expected.to contain_file('/etc/rkhunter.conf').with(
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0644'
        )
      end
    end
  end
end
