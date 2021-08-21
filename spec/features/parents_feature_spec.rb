require 'rails_helper'

describe 'Parent' do
  describe 'As a visitor' do
    describe 'When I visit parents index page' do
      it 'should see the name of each parent record in the system' do
        parent1 = create(:parent)
        parent2 = create(:parent)
        parent3 = create(:parent)
        parent4 = create(:parent)
        parent5 = create(:parent)

        visit '/parents'

        expect(page).to have_content('Parents')
        expect(page).to have_content(parent1.name)
        expect(page).to have_content(parent2.name)
        expect(page).to have_content(parent3.name)
        expect(page).to have_content(parent4.name)
        expect(page).to have_content(parent5.name)
      end

      it 'should see records that were created from first to last with creation date' do
        parent1 = create(:parent)
        parent2 = create(:parent)
        parent3 = create(:parent)
        parent4 = create(:parent)
        parent5 = create(:parent)

        visit '/parents'
        expect(page).to have_content(Time.parse(parent1.created_at.to_s.gsub('UTC', '')))
        expect(page).to have_content(Time.parse(parent2.created_at.to_s.gsub('UTC', '')))
        expect(page).to have_content(Time.parse(parent3.created_at.to_s.gsub('UTC', '')))
        expect(page).to have_content(Time.parse(parent4.created_at.to_s.gsub('UTC', '')))
        expect(page).to have_content(Time.parse(parent5.created_at.to_s.gsub('UTC', '')))
      end

      it 'should see a link to create a new parent' do
        visit '/parents'

        expect(page).to have_link('New Parent')

        click_link 'New Parent'

        expect(current_path).to eq('/parents/new')
      end

      it 'should see a link next to each parent to edit.' do
        parent1 = create(:parent)
        create(:parent)
        create(:parent)
        create(:parent)
        create(:parent)

        visit '/parents'

        within ".parent-#{parent1.id}" do
          expect(page).to have_link('Edit')
          click_link 'Edit'
        end

        expect(current_path).to eq("/parents/#{parent1.id}/edit")
      end

      it 'should be able to delete parent form parents index page' do
        parent1 = create(:parent)
        create(:parent)
        create(:parent)
        create(:parent)
        create(:parent)

        visit '/parents'

        within ".parent-#{parent1.id}" do
          expect(page).to have_link('Delete')

          click_link 'Delete'
        end

        expect(current_path).to eq('/parents')

        expect(page).to_not have_content(parent1.name)
      end
    end

    describe 'When I visit Parent show page' do
      it 'should see parent ID and its attributes' do
        parent = create(:parent)

        visit "/parents/#{parent.id}"

        expect(page).to have_content("Parent: #{parent.id}")

        within '.parent-attrs' do
          expect(page).to have_content("Name: #{parent.name}")
          expect(page).to have_content("Age: #{parent.age}")
          expect(page).to have_content("Married: #{parent.married}")
        end
      end

      it 'should have the parents children count' do
        parent = create(:parent)
        create(:child, parent_id: parent.id)
        create(:child, parent_id: parent.id)

        visit "/parents/#{parent.id}"

        within '.parent-attrs' do
          expect(page).to have_content("Children Count: #{parent.children.length}")
        end
      end

      it 'should have a link to update a parent' do
        parent = create(:parent)

        visit "/parents/#{parent.id}"

        expect(page).to have_link('Update Parent')

        click_link 'Update Parent'

        expect(current_path).to eq("/parents/#{parent.id}/edit")
      end

      it 'should see a link to delete parent and its kids' do
        parent = create(:parent)

        create(:child, parent_id: parent.id)
        create(:child, parent_id: parent.id)
        create(:child, parent_id: parent.id)

        visit "/parents/#{parent.id}"

        expect(page).to have_link('Delete Parent')

        click_link 'Delete Parent'

        expect(current_path).to eq('/parents')
      end
    end

    describe 'When I visit every page' do
      it 'should have a link to parents index' do
        visit '/childrens'

        expect(page).to have_link('Parents')

        click_link 'Parents'

        expect(current_path).to eq('/parents')

        visit '/parents'

        expect(page).to have_link('Parents')
      end
    end

    describe 'When I visit the new page' do
      it 'should create a new parent' do
        visit '/parents/new'

        fill_in :name, with: 'Kevin Cuadros'
        fill_in :age, with: 30
        fill_in :married, with: true

        click_button 'CreateParent'

        expect(current_path).to eq('/parents')
      end
    end

    describe 'When I visit the edit page' do
      it 'should be form where I can update current parent attributes' do
        parent = create(:parent)

        visit "/parents/#{parent.id}/edit"

        fill_in :name, with: 'Kevin Cuadros'
        fill_in :age, with: 40
        fill_in :married, with: false

        click_button 'Submit'

        expect(current_path).to eq("/parents/#{parent.id}")
      end
    end
  end
end
