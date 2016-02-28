class Metrics
  def write_data_points(options)
    client.write_points(data_points(options))
  rescue => e
    Rails.logger.error "Error while using Metrics: #{e}"
    Rails.logger.error e.backtrace
  end

  private

  def client
    @client ||= InfluxDB::Client.new(
      host:     ENV['INFLUXDB_HOST'],
      port:     ENV['INFLUXDB_PORT'],
      database: ENV['INFLUXDB_DATABASE'],
      user:     ENV['INFLUXDB_USER'],
      password: ENV['INFLUXDB_PASSWORD']
    )
  end

  def data_points(options)
    [
      {
        series: 'endpoint_stats',
        values: {
          endpoint: options[:endpoint],
          duration: options[:duration],
          view_runtime: options[:view_runtime] || 0
        }
      }
    ]
  end
end
