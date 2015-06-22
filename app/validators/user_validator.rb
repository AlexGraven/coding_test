class UserValidator < ActiveModel::Validator
  def validate(record)
    errors = UserHashValidator.new.validate_hash(record.attributes.except('id', 'created_at', 'updated_at'))
    [:first_name, :last_name, :sex, :personality].each do |category|
      unless errors[category] == [nil]
        record.errors[category] << errors[category]
        record.errors[category].flatten!
      end
    end
  end
end
