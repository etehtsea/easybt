require 'spec_helper'

feature "Posts", %q{
  In order to add news
  As an admin
  I want to CRUD posts
} do

  scenario "Posts list" do
    2.times { Fabricate(:post) }
    visit posts_path

    page.should have_content('Post #1')
    page.should have_content('Post #2')
  end

  scenario "Create post" do
    visit new_post_path

    fill_in 'Title', :with => 'New post'
    fill_in 'Body',  :with => 'Post body'

    click_button 'Save'

    page.should have_content('New post')
    page.should have_content('Post body')
  end

  scenario "Delete post" do
    Fabricate(:post, :title => 'New post')

    visit posts_path
    click_link 'Destroy'

    page.should have_no_content('New post')
  end

  scenario "Edit post" do
    Fabricate(:post, :title => 'New post')
    visit posts_path

    click_link 'Edit'
    fill_in 'Title', :with => 'Edited post'
    click_button 'Save'

    page.should have_content('Edited post')
  end
end
