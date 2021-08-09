require 'rails_helper'

describe 'Children' do
  describe 'As a Visitor' do
    describe 'When I visit the children index page' do
      it 'should see each childs name in the system and attributes' do
        child1 = create(:child)

        visit '/childrens'

        expect(page).to have_content('Children')

        within ".child-#{child1.id}" do
          expect(page).to have_content(child1.name)
          expect(page).to have_content(child1.age)
        end
      end
    end
  end
end