require 'spec_helper'

describe User do

  context 'testing custom validator' do

    it 'when first name is nil' do
      user = User.create('first_name' => '')
      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to eq(['Cannot be blank'])
    end
  end

end
