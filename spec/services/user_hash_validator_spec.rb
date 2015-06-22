require 'spec_helper'

describe UserHashValidator do

  let(:hash_validator) { UserHashValidator.new }

  it "when first name of a hash is absent" do
    test_user_hash = {'last_name' => 'Davis'}
    expect(hash_validator.validate_hash(test_user_hash)[:first_name]).to eq(['Cannot be blank'])
  end

  it "when first name of a hash is nil" do
    test_user_hash = {'first_name' => nil}
    expect(hash_validator.validate_hash(test_user_hash)[:first_name]).to eq(['Cannot be blank'])
  end

  it "when first name of a hash is absent" do
    test_user_hash = {'first_name' => ''}
    expect(hash_validator.validate_hash(test_user_hash)[:first_name]).to eq(['Cannot be blank'])
  end

  it "when first name of a hash is too short" do
    test_user_hash = {'first_name' => 'Zw'}
    expect(hash_validator.validate_hash(test_user_hash)[:first_name]).to eq(['Too short'])
  end

  it "when first name of a hash is non-alphanumeric" do
    test_user_hash = {'first_name' => '^%&&&&&'}
    expect(hash_validator.validate_hash(test_user_hash)[:first_name]).to eq(['Must be alphanumeric'])
  end

end
