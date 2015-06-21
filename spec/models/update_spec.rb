require 'spec_helper'

describe Update do
  it {should validate_presence_of(:csv_file)}
end
