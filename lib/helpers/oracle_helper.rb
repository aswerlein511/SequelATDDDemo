module OracleHelper

  def connect_to_oracle
    $oracle_connection = Sequel.connect("#{get_information_for('adapter')}://#{get_information_for('username')}:#{Base64.decode64(get_information_for('password'))}@#{get_information_for('database')}")
  end

  def execute_query_in_oracle_for(table, query)
    @results = $oracle_connection.fetch(get_data_from_yml_file('oracle_sql_queries.yml')[make_const(table.underscore)][make_const(query)]).all
  end

  def get_ddl_from_schema_for(table)
    db, table = table.split('.').first, table.split('.').last
    $oracle_connection.fetch("select DBMS_METADATA.get_ddl ('TABLE', '#{table.upcase}', '#{db.upcase}') as table_ddl FROM dual").first[:table_ddl].remove_spaces
  end

end