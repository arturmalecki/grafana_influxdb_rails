ActiveSupport::Notifications.subscribe('process_action.action_controller') do |*args|
  event  = ActiveSupport::Notifications::Event.new(*args)
  endpoint = "#{event.payload[:method]}_#{event.payload[:controller]}##{event.payload[:action]}"

  Metrics.new.write_data_points(
    endpoint: endpoint,
    duration: event.duration,
    view_runtime: event.payload[:view_runtime]
  )
end
