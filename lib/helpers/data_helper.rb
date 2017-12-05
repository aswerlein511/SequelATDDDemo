module DataHelper

  def application_environment
    ENV['app_env'].nil? ? 'DEV' : ENV['app_env'].gsub(' ','_').upcase
  end

  def get_data_from_yml_file(file_path)
    begin
      YAML.load(ERB.new(File.read("#{DATA_DIR}/#{file_path}")).result)
    rescue Errno::ENOENT
      Hash.new({})
    end
  end

  def make_const(string)
    string.gsub(' ','_').upcase
  end

  def get_information_for(locator)
    get_data_from_yml_file('database_credentials.yml')[application_environment.upcase][locator.upcase]
  end

  def get_expected_ddl(class_name)
    File.read("#{DATA_DIR}/ddls/#{class_name.underscore}_ddl.txt").remove_spaces
  end

end

class String
  def remove_spaces
    self.split("\n").map(&:strip).join("\n").strip
  end
end