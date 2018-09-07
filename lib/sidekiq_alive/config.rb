module SidekiqAlive
  class Config
    include Singleton

    attr_accessor :port,
                  :liveness_key,
                  :time_to_live,
                  :callback,
                  :registered_instance_key

    def initialize
      @port = ENV['SIDEKIQ_ALIVE_PORT'] || 7433
      @liveness_key = 'SIDEKIQ::LIVENESS_PROBE_TIMESTAMP'
      @time_to_live = 10 * 60
      @callback = proc {}
      @registered_instance_key = "SIDEKIQ_REGISTERED_INSTANCE"
    end

  end
end
