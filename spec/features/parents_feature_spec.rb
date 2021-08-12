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
    end
  end
end
