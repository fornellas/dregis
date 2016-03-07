require 'dregis'
require 'logger'

RSpec.describe DRegis do
  let(:domain) { 'registry.docker.example.com' }
  let(:port) { 443 }
  let(:username) { 'username' }
  let(:password) { 'password' }
  let(:default_net_http_start_opt) do
    {
      open_timeout: 5,
      read_timeout: 30,
      use_ssl: true,
    }
  end
  context '#initialize' do
    context 'default values' do
      subject { described_class.new(domain: domain) }
      let(:default_attributes) do
        {
          domain: domain,
          port: 443,
          username: nil,
          password: nil,
          net_http_start_opt: default_net_http_start_opt,
        }
      end
      it { is_expected.to have_attributes(default_attributes) }
    end
    context 'custom values passed' do
      let(:custom_port) { 80 }
      let(:logger) { instance_double(Logger) }
      subject do
        described_class.new(
          domain: domain,
          port: custom_port,
          username: username,
          password: password,
          net_http_start_opt: {use_ssl: false},
          logger: logger,
        )
      end
      let(:custom_attributes) do
        {
          domain: domain,
          port: custom_port,
          username: username,
          password: password,
          net_http_start_opt: default_net_http_start_opt.merge(use_ssl: false),
          logger: logger,
        }
      end
      it { is_expected.to have_attributes(custom_attributes) }
    end
  end
end
