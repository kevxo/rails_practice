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

      it 'should only show children with true boolean' do
        child1 = create(:child)
        child2 = create(:child)
        child3 = create(:child)
        child4 = create(:child, is_adopted: false)
        child5 = create(:child, is_adopted: false)

        visit '/childrens'

        expect(page).to have_content(child1.name)
        expect(page).to have_content(child2.name)
        expect(page).to have_content(child3.name)
        expect(page).to_not have_content(child4.name)
        expect(page).to_not have_content(child5.name)
      end

      it 'should have a link next to each child to edit' do
        child1 = create(:child)
        create(:child)
        create(:child)

        visit '/childrens'

        within ".child-#{child1.id}" do
          expect(page).to have_link('Edit')
          save_and_open_page

          click_link 'Edit'
        end

        expect(current_path).to eq("/childrens/#{child1.id}/edit")
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

      it 'should have a link to update the child attributes' do
        child1 = create(:child)

        visit "/childrens/#{child1.id}"

        expect(page).to have_link('Update Child')

        click_link 'Update Child'

        expect(current_path).to eq("/childrens/#{child1.id}/edit")
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

    describe 'When I visit the edit page for child' do
      it 'should able to update a childs attributes' do
        child = create(:child)

        visit "/childrens/#{child.id}/edit"

        fill_in :name, with: 'John Cena'
        fill_in :age, with: 15

        click_button 'Update Child'

        expect(current_path).to eq("/childrens/#{child.id}")
      end
    end
  end
end
