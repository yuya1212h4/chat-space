module ChatSpace
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
  end
end

Time::DATE_FORMATS[:default] = '%Y/%m/%d %H:%M'
