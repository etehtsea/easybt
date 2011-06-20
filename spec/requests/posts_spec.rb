require 'spec_helper'

feature "Posts", %q{
  In order to add news
  As an admin
  I want to CRUD posts
} do

  let(:user) { Fabricate(:user, admin: true) }

  background { sign_in(user) }

  scenario "Posts list" do
    2.times { Fabricate(:post) }
    visit posts_path

    page.should have_content(Post.first.title)
    page.should have_content(Post.last.title)
  end

  scenario "Create post" do
    visit new_post_path

    fill_in 'Title', :with => 'New post'
    fill_in 'Body',  :with => 'Post body'

    click_button 'Create Post'

    page.should have_css("#flash_notice",
                         :text => 'Post was successfully created.')
    page.should have_content('New post')
    page.should have_content('Post body')
  end

  scenario "Delete post" do
    Fabricate(:post, :title => 'New post')

    visit posts_path
    click_link 'Destroy'

    page.should have_css("#flash_notice",
                         :text => 'Post was successfully destroyed.')
    page.should have_no_content('New post')
  end

  scenario "Edit post" do
    Fabricate(:post, :title => 'New post')
    visit posts_path

    click_link 'Edit'
    fill_in 'Title', :with => 'Edited post'
    click_button 'Update Post'

    page.should have_content('Edited post')
  end
end
