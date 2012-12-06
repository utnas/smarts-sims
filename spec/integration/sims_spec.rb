require 'spec_helper'

feature 'Sims site navigation' do
    # include Helpers

    background do
        visit '/'
    end

    scenario 'go to home through Bootstrap Home button' do
        page.find('a', text: 'Sims Home').click
        page.should have_content('Inhabitants at Home')
    end


    # scenario 'select and deselect project' do
    #     first_item = page.find(:xpath, '//label[contains(.//a/text(), "Demo project")]')
    #     within(first_item) do
    #         first_item.click
    #         page.should have_xpath('input[@checked="checked"]')
    #     end
    # end
end
