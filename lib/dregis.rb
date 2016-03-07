class DRegis

  DEFAULT_NET_HTTP_START_OPT = {
    open_timeout: 5,
    read_timeout: 30,
    use_ssl: true,
  }.freeze

  # Docker Registry domain.
  attr_reader :domain
  # TCP port.
  attr_reader :port
  # Username.
  attr_reader :username
  # Password.
  attr_reader :password
  # Net::HTTP.start options in use.
  attr_reader :net_http_start_opt
  # Logger object.
  attr_reader :logger

  # Creates a new Docker Registry client. Must receive a Hash with:
  # +domain+:: Docker Registry domain.
  # +port+:: TCP port to connect to.
  # +username+:: Username (optional).
  # +password+:: Password (optional).
  # +net_http_start_opt+:: Options to Net::HTTP.start. The Hash passed here, will be merged with DEFAULT_NET_HTTP_START_OPT, and used as opt argument to Net::HTTP.start.
  # +logger+:: Logger object where to log to.
  def initialize(
    domain:,
    port: 443,
    username: nil,
    password: nil,
    net_http_start_opt: DEFAULT_NET_HTTP_START_OPT.dup,
    logger: nil
    )
    @domain             = domain
    @port               = port
    @username           = username
    @password           = password
    @net_http_start_opt = DEFAULT_NET_HTTP_START_OPT.merge(net_http_start_opt)
    @logger             = logger
  end

end
