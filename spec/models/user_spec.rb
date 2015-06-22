require 'spec_helper'

describe User do


  it 'tests the happy path' do
    user = User.create('first_name' => 'Juan')
    expect(user).to be_valid
  end

  context 'testing custom validator' do

    it 'when first name is nil' do
      user = User.create('first_name' => '')
      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to eq(['Cannot be blank'])
    end
  end

end
