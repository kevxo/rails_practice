require 'rails_helper'

describe 'Parent' do
  describe 'As a visitor' do
    describe 'When I visit parents index page' do
      it 'should see the name of each parent record in the system' do
        user1 = create(:parent)
        user2 = create(:parent)
        user3 = create(:parent)
        user4 = create(:parent)
        user5 = create(:parent)

        visit '/parents'

        expect(page).to have_content('Parents')
        expect(page).to have_content(user1.name)
        expect(page).to have_content(user2.name)
        expect(page).to have_content(user3.name)
        expect(page).to have_content(user4.name)
        expect(page).to have_content(user5.name)
      end
    end
  end
end