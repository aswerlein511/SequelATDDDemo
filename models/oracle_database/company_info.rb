class CompanyInfo < Sequel::Model($oracle_connection[Sequel.qualify('hb22727', 'company_info')])
  set_primary_key [:company_id]

  attr_reader :ddl,
              :columns,
              :expected_ddl,
              :count

  def initialize
    @ddl = get_ddl_from_schema_for(self.class.simple_table.tr('"',''))
    @columns = self.class.columns
    @expected_ddl = get_expected_ddl(self.class.to_s).remove_spaces
    @count = self.class.count
  end

end