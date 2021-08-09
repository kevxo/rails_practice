require 'rails_helper'

describe 'Parent Child' do
  describe 'As a visitor' do
    describe 'When I visit the Parent Child index' do
      it 'should see child that is associated with that parent with each Childs attributes' do
        parent = create(:parent)

        child1 = create(:child, age: 5, parent_id: parent.id)
        create(:child, age: 5, parent_id: parent.id)
        child3 = create(:child)

        visit "/parents/#{parent.id}/childrens"

        expect(page).to have_content('Parents Kids')

        within ".child-#{child1.id}" do
          expect(page).to have_content(child1.name)
          expect(page).to have_content(child1.age)
          expect(page).to_not have_content(child3.name)
          expect(page).to_not have_content(child3.age)
        end
      end
    end
  end
end