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

    describe 'When I visit the child page' do
      it 'should see the child with the ID and its attributes' do
        child1 = create(:child)

        visit "/childrens/#{child1.id}"

        expect(page).to have_content("Child: #{child1.id}")

        within '.child-attributes' do
          expect(page).to have_content("Name: #{child1.name}")
          expect(page).to have_content("Age: #{child1.age}")
        end
      end
    end

    describe 'When I visit every page on the site' do
      it 'should see the link to the index page' do
        visit '/parents'

        expect(page).to have_link('Children')

        click_link 'Children'

        expect(current_path).to eq('/childrens')

        visit '/childrens'

        expect(page).to have_link('Children')
      end
    end
  end
end
