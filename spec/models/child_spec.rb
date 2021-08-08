require 'rails_helper'

RSpec.describe Child, type: :model do
  describe 'relationships' do
    it { should belong_to(:parent) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
  end
end
