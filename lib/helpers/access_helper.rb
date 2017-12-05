module AccessHelper

  def connect_to_access_for_persistence
    $access_jenkins_connection = Sequel.ado({conn_string: "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=#{ROOT_DIR}/execution_results.accdb"})
  end

  def write_results_to_table
    FactoryBot.create(:results, location: @location, feature: @feature, scenario: @scenario, exception: @failure_message,
                      start_time: @start_time, end_time: @end_time, run_time: @end_time - @start_time, status: @status)
  end

end