require 'spec_helper'

describe Update do

  it {should validate_presence_of(:csv_file)}

  it "when given a valid CSV path to add" do
    update = Update.new csv_file: File.new("#{Rails.root}/spec/fixtures/files/test_csv.csv")
    update.save
    #expect(update).to receive(:write_users_to_db)
      #.with(["('Alex', ' Graven',  42, ' M', ' cool')", "('Juan', ' Sepulveda',  62, ' M', ' strong')", "('Lily', ' Graven',  10, ' F', ' silly')"])
      expect(update.create_users_from_batch).to eql([])
      expect(Update.count).to eql(1)
      expect(Update.first.users.count).to eq(3)
  end

  it "when given an invalid CSV to add" do
    update_invalid = Update.new csv_file: File.new("#{Rails.root}/spec/fixtures/files/missing_test_csv.csv")
    update_invalid.save
    #expect(update_invalid).to receive(:write_users_to_db)
     # .with(["('Alex', ' Graven',  42, ' M', ' cool')", "('Lily', ' Graven',  10, ' F', ' silly')"])
    expect(update_invalid.create_users_from_batch).to eql([2])
    expect(Update.count).to eq(1)
    expect(Update.first.users.count).to eq(2)
  end
end
