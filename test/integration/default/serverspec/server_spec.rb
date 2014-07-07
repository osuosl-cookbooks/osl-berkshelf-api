require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe file('/etc/berkshelf/api-server/config.json') do
  it { should be_file }
  its(:content) { should match /github/ }
  its(:content) { should match /faketoken/ }
  its(:content) { should match /example.com/ }
end

describe command('python -m json.tool /etc/berkshelf/api-server/config.json') do
  it { should return_exit_status 0 }
end
