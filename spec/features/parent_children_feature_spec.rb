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

      it 'should see a link to add a adoptable child' do
        parent = create(:parent)

        visit "/parents/#{parent.id}/childrens"

        expect(page).to have_link('Create Child')

        click_link 'Create Child'

        expect(current_path).to eq("/parents/#{parent.id}/childrens/new")
      end

      it 'should see a link to sort the children in alphabetical order' do
        parent = create(:parent)

        child1 = create(:child, name: 'Lola Zu', parent_id: parent.id)
        child2 = create(:child, name: 'Jack Spears', parent_id: parent.id)
        child3 = create(:child, name: 'Alex Smith', parent_id: parent.id)
        child4 = create(:child, name: 'John Cena', parent_id: parent.id)
        child5 = create(:child, name: 'Linda Scott', parent_id: parent.id)

        visit "/parents/#{parent.id}/childrens"

        expect(page).to have_link('Sort Kids')

        click_link 'Sort Kids'

        within all('.kid')[0] do
          expect(page).to have_content(child3.name)
        end

        within all('.kid')[1] do
          expect(page).to have_content(child2.name)
        end

        within all('.kid')[2] do
          expect(page).to have_content(child4.name)
        end

        within all('.kid')[3] do
          expect(page).to have_content(child5.name)
        end

        within all('.kid')[4] do
          expect(page).to have_content(child1.name)
        end
      end

      it 'should see a link to edit each child' do
        parent = create(:parent)

        child1 = create(:child, parent_id: parent.id)
        create(:child, parent_id: parent.id)
        create(:child, parent_id: parent.id)

        visit "/parents/#{parent.id}/childrens"

        within ".child-#{child1.id}" do
          expect(page).to have_link('Edit')

          click_link 'Edit'
        end

        expect(current_path).to eq("/childrens/#{child1.id}/edit")
      end

      it 'should see a search bar where I can input a number and filter records' do
        parent = create(:parent)

        child1 = create(:child, parent_id: parent.id, age: 10)
        child2 = create(:child, parent_id: parent.id, age: 12)
        child3 = create(:child, parent_id: parent.id, age: 5)

        visit "/parents/#{parent.id}/childrens"

        fill_in :age, with: 7

        click_button 'Submit'

        expect(current_path).to eq("/parents/#{parent.id}/childrens")

        expect(page).to have_content(child1.name)
        expect(page).to have_content(child2.name)
        expect(page).to_not have_content(child3.name)
      end
    end

    describe 'When I visit ever page' do
      it 'should see a link to the parent child index page' do
        parent = create(:parent)


        visit "/parents/#{parent.id}"

        expect(page).to have_link('Parents Kids')

        click_link 'Parents Kids'

        expect(current_path).to eq("/parents/#{parent.id}/childrens")
      end
    end

    describe 'When I visit the create child page' do
      it 'should be a form where I can fill out attributes for a child' do\
        parent = create(:parent)

        visit "/parents/#{parent.id}/childrens/new"

        fill_in :name, with: 'Johnny Cash'
        fill_in :age, with: 10

        click_button 'Create Child'

        expect(current_path).to eq("/parents/#{parent.id}/childrens")
      end
    end
  end
end