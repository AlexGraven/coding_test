class UserHashValidator
  def validate_hash(user_hash)
    errors = []
    errors << "First name absent" if (!user_hash.has_key?('first_name') || user_hash['first_name'].nil? || user_hash['first_name'].empty?)
    errors
  end
end
