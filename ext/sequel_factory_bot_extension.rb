class Sequel::Model
  def save!
    save(:validate => false)
  end
end