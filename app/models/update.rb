class Update < ActiveRecord::Base
  has_attached_file :csv_file
  validates_attachment_presence :csv_file
  validates_attachment_content_type :csv_file, :content_type => ['text/csv','text/comma-separated-values','text/csv','application/csv','application/excel','application/vnd.ms-excel','application/vnd.msexcel','text/anytext','text/plain']
end
