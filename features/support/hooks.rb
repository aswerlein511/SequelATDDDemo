Before do |scenario|
  begin
    connect_to_access_for_persistence
    require 'access/results'
    @scenario, @location, @feature, @start_time = scenario.name, scenario.location.to_s, scenario.feature.to_s, Time.now
  rescue Exception => e
    p(e)
  end
end

After do |scenario|
  @end_time, @failure_message, @status = Time.now, scenario.exception.to_s.gsub(/\(.*\)/, '').strip, scenario.status.to_s.strip

  begin
    write_results_to_table if @status == 'failed'
  rescue Exception => e
    p(e)
  end
end