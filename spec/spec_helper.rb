ROOT_DIR = File.join(File.dirname(__FILE__), '..')
$LOAD_PATH.unshift(ROOT_DIR)

require 'env'

RSpec.configure do |c|
  c.before(:each) do |spec|
    @info = spec.metadata
    @scenario, @location, @feature, @start_time = spec.description, spec.location, spec.example_group.metadata[:full_description], Time.now
  end

  c.after(:each) do |spec|
    @end_time, @failure_message, @status = Time.now, spec.exception.to_s.gsub(/\(.*\)/, '').strip, spec.exception.nil? ? 'passed' : 'failed'
    write_results_to_table if @status == 'failed'
  end
end