require 'CSV'

class Update < ActiveRecord::Base
  has_attached_file :csv_file
  validates_attachment_presence :csv_file
  validates_attachment_content_type :csv_file, :content_type => ['text/csv','text/comma-separated-values','text/csv','application/csv','application/excel','application/vnd.ms-excel','application/vnd.msexcel','text/anytext','text/plain']

  has_many :users, dependent: :destroy

  def create_users_from_batch
    users = []
    erroring_rows = []
    current_row = 1
    user_hash_validator = UserHashValidator.new

    CSV.foreach(self.csv_file.path, headers: true) do |row|
      row = row.to_hash
      errors = user_hash_validator.validate_hash(row).values.flatten
      users.push "('#{row['first_name']}', '#{row['last_name']}', #{row['age']}, '#{row['sex']}', '#{row['personality']}')"  if errors == [nil]
      erroring_rows << current_row unless errors == [nil]
      current_row += 1
    end
    write_users_to_db users
    erroring_rows
  end

  private

  def write_users_to_db users
    conn = ActiveRecord::Base.connection
    sql = "INSERT INTO users (first_name, last_name, age, sex, personality) VALUES #{users.join(', ')}"
    conn.execute sql
  end

end
