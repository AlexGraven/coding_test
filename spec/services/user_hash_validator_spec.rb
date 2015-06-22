require 'spec_helper'

describe UserHashValidator do

  let(:hash_validator) { UserHashValidator.new }

  it "when first name of a hash is absent" do
    test_user_hash = {'last_name' => 'Davis', 'age' => 74, 'sex' => 'M', 'personality' => 'cool'}
    expect(hash_validator.validate_hash(test_user_hash)).to eq(['First name absent'])
  end

  it "when first name of a hash is nil" do
    test_user_hash = {'first_name' => nil, 'last_name' => 'Davis', 'age' => 74, 'sex' => 'M', 'personality' => 'cool'}
    expect(hash_validator.validate_hash(test_user_hash)).to eq(['First name absent'])
  end

  it "when first name of a hash is absent" do
    test_user_hash = {'first_name' => '', 'last_name' => 'Davis', 'age' => 74, 'sex' => 'M', 'personality' => 'cool'}
    expect(hash_validator.validate_hash(test_user_hash)).to eq(['First name absent'])
  end
end
