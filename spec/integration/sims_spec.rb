require 'spec_helper'

feature 'Sims site navigation' do
    # include Helpers

    background do
        visit '/'
    end

    # scenario 'click on Home button' do
    #     page.find('a', text: 'Sims Home').click
    #     page.should have_content('Sign in')
    # end

    # scenario 'click on sign up to sims app' do
    #     page.find('a', text: 'Sign up').click
    #     page.should have_content('Sign Up')
    # end

    # scenario 'sign up to sims app' do
    #     sign_up
    #     page.should have_content('Sign in')
    # end

    # scenario 'sign in to sims app' do
    #     sign_up
    #     sign_in
    #     page.should have_content('Inhabitants at Home')
    # end

    # scenario 'sign in and sign out to sims app' do
    #     sign_up
    #     sign_in
    #     page.should have_content('Inhabitants at Home')
    #     page.find('a', text: 'Logout').click
    #     page.should have_content('Sign in')
    # end

    # scenario 'create new inhabitant' do
    #     sign_up
    #     sign_in
    #     create_inhabitant('Sophie', 'lastname','Female')
    #     page.should have_content('Sophie')
    # end

    scenario 'delete an inhabitant' do
        sign_up
        sign_in
        create_inhabitant('Sophie', 'lastname','Female')
        page.should have_content('Sophie')
        page.find('a', image: 'delete3.png').click
        page.should have_no_content('Sophie')
    end

    # scenario 'delete an inhabitant' do
    #     sign_up
    #     sign_in
    #     create_inhabitant('inhab', 'name','Female')
    #     page.find('a', img: 'delete3').click
    #     page.should have_no_content('inhab')
    # end

    # scenario 'get married' do
    #     sign_up
    #     sign_in
    #     get_married
    #     page.should have_content('Inhabitants at Home')
    # end

    # scenario 'divorce' do
    #     sign_up
    #     sign_in
    #     get_married
    #     page.should have_content('Inhabitants at Home') 
    #     page.find('a', text: 'Go to Court').click
    #     page.find('a', text: 'Divorce').click
    #     page.should have_content('New divorce')
    #     page.select('Female lastname', :from => 'divorce_first_person_id')
    #     page.select('Male lastname1', :from => 'divorce_second_person_id')
    #     page.click_button('Divorce')
    #     page.should have_content('Inhabitants at Home')
    # end

    # scenario 'select and deselect project' do
    #     first_item = page.find(:xpath, '//label[contains(.//a/text(), "Demo project")]')
    #     within(first_item) do
    #         first_item.click
    #         page.should have_xpath('input[@checked="checked"]')
    #     end
    # end

    #----------------------- 
    # Utilities
    #-----------------------

    def get_married 
        create_inhabitant('Female', 'lastname','Female')
        create_inhabitant('Male', 'lastname1','Male')
        page.find('a', text: 'Go to church').click
        page.should have_content('lastname')
        page.should have_content('lastname1')
        page.find('a', text: 'Get married').click
        page.should have_content('New marriage')
        page.select('Female lastname', :from => 'wedding_first_spouse_id')
        page.select('Male lastname1', :from => 'wedding_second_spouse_id')
        page.click_button('Get Married')
    end

    def create_inhabitant(firtname, lastname, gender) 
        page.find('a', text: 'New Inhabitant').click
        page.fill_in 'inhabitant_first_name', :with => firtname
        page.fill_in 'inhabitant_last_name', :with => lastname
        select(gender, :from => 'inhabitant_gender')
        page.fill_in 'inhabitant_age', :with => '20'
        page.click_button('Create Inhabitant')
    end

    def sign_up 
        page.find('a', text: 'Sign up').click
        page.fill_in 'user_username', :with => 'sophie'
        page.fill_in 'Email', :with => 'sophie@free.fr'
        page.fill_in 'Password', :with => 'password'
        page.fill_in 'Password confirmation', :with => 'password'
        page.click_button('Create User')
    end

    def sign_in
       page.fill_in 'username', :with => 'sophie'
       page.fill_in 'Password', :with => 'password'   
       click_button('Sign in')      
    end
end
