require 'spec_helper'

feature 'qunit' do
     scenario 'run' do
        visit '/qunit'
        page.find(:xpath, '//*[@id="qunit-testresult"]/span[3]').should have_content('0')
    end
end