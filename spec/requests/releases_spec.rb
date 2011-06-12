require 'spec_helper'

feature "Releases", %q{
  In order to add releases
  As an user
  I want to CRUD own and view foreign releases
} do

  scenario "Releases list" do
    2.times { Fabricate(:release) }
    visit releases_path

    page.should have_content('Release #1')
    page.should have_content('Release #2')
  end

  scenario "Create valid release" do
    visit new_release_path

    fill_in 'Title', :with => 'New release'
    fill_in 'Description',  :with => 'Release body'
    attach_file 'Torrent', "#{Rails.root}/spec/support/files/demo.torrent"
    click_button 'Create Release'

    page.should have_css("#flash_notice",
                         :text => 'Release was successfully created.')
    page.should have_content('New release')
    page.should have_content('Release body')
  end

  scenario "Delete release" do
    Fabricate(:release, :title => 'New release')

    visit releases_path
    click_link 'Destroy'

    page.should have_css("#flash_notice",
                         :text => 'Release was successfully destroyed.')
    page.should have_no_content('New release')
  end

  scenario "Edit release" do
    Fabricate(:release, :title => 'New release')
    visit releases_path

    click_link 'Edit'
    fill_in 'Title', :with => 'Edited release'
    click_button 'Update Release'

    page.should have_content('Edited release')
  end
end
