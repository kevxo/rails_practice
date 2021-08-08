require 'rails_helper'

RSpec.describe Parent, type: :model do
  describe 'relationships' do
    it { should have_many(:children) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
  end
end
