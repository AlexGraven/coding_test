class UserHashValidator
  def validate_hash(user_hash)
    errors = {first_name: [], last_name: [], sex: [], personality: []}
    errors[:first_name] << "Cannot be blank" unless user_hash.has_key?('first_name')
    errors[:first_name] << validate_first_name(user_hash['first_name']) if user_hash.has_key?('first_name')
    errors
  end

  private

   def validate_first_name first_name
    return "Cannot be blank" if first_name.nil?
    return "Too short" if first_name.length() < 3
    return "Must be alphanumeric" if first_name.match(/[^a-zA-Z]+/)
   end
end
