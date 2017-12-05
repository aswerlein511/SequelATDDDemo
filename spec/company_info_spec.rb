require 'spec_helper'
require 'models/oracle_database/company_info'

describe 'CompanyInfo' do

  let(:table) {CompanyInfo.new}

  context 'oracle_database' do

    it 'will successfully have connection to oracle_database' do
      expect($oracle_connection.test_connection).to eq(true)
    end

    it 'will contain table CompanyInfo' do
      expect($oracle_connection.tables.include?(table.model.to_s.intern))
    end
  end

  context 'table' do

    it 'will have the correct structure' do
      expect(table.ddl).to eq(table.expected_ddl)
    end

    %w[company_id company_name company_motto company_start something].each do |expected_column|
      it "will contain column: #{expected_column}" do
        expect(table.columns.include?(expected_column.intern)).to eq(true)
      end
    end
  end

  context 'data' do

    it 'will be present' do
      expect(table.count).to be > 0
    end

    it 'will sort the data based on company_id desc' do
      expect(CompanyInfo.select(table.primary_key.intern).reverse(:company_id).first[table.primary_key.intern]).to eq(4)
    end

    it 'will have no null values for company_id' do
      expect(CompanyInfo.where(table.primary_key.intern => nil).all.count).to eq(0)
    end

    it 'will have no low end dates for company_start' do
      expect(CompanyInfo.where(company_start: '01-JAN-1000').all.count).to eq(0)
    end

    it 'will have only one instance of each company_id with query' do
      expect(execute_query_in_oracle_for('company_info','unique_id').count).to eq(0)
      # SELECT company_id, count(company_id)
      # FROM hb22727.company_info
      # GROUP BY company_id
      # HAVING count(company_id) > 1
    end

    it 'will have only one instance of each company_id with Ruby' do
      expect(CompanyInfo.group_and_count(table.primary_key.intern).having{count(:company_id) > 1}.all.count).to eq(0)
    end
  end

  context 'CRUD' do
    it 'will insert new record' do
      CompanyInfo.insert(company_id: 100)
      expect(CompanyInfo.reverse(:company_id).first[:company_id]).to eq(100)
    end

    it 'will update existing record' do
      CompanyInfo.where(company_id: 100).update(company_id: 999)
      expect(CompanyInfo.where(company_id: 100).count).to eq(0)
      expect(CompanyInfo.where(company_id: 999).count).to eq(1)
    end

    it 'will delete updated record' do
      CompanyInfo.where(company_id: 999).delete
      expect(CompanyInfo.where(company_id: 999).count).to eq(0)
    end
  end
end