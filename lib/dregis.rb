class DRegis

  DEFAULT_NET_HTTP_START_OPT = {
    open_timeout: 5,
    read_timeout: 30,
  }.freeze

  # Docker Registry domain.
  attr_reader :domain
  # Username.
  attr_reader :username
  # Password.
  attr_reader :password

  # Creates a new Docker Registry client. Must receive a Hash with:
  # +domain+:: Docker Registry domain.
  # +username+:: Username (optional).
  # +password+:: Password (optional).
  # +net_http_start_opt+:: opt Hash to be passed to Net::HTTP.start. Default: DEFAULT_NET_HTTP_START_OPT. Note: +:use_ssl+ is always set to +true+.
  def initialize(
    domain:,
    username: nil,
    password: nil,
    net_http_start_opt: DEFAULT_NET_HTTP_START_OPT.dup
    )
    @domain             = domain
    @username           = username
    @password           = password
    @net_http_start_opt = DEFAULT_NET_HTTP_START_OPT.merge(
      net_http_start_opt.merge(use_ssl: true)
    )
    @net_http = Net::HTTP.start(domain, 443, @net_http_start_opt)
    version_check
  end

  # Validates that Docker Registry implements current API version (GET /v2/).
  def version_check
    http_get('v2/')
  end

end
