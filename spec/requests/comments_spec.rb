require 'spec_helper'

feature "Comments", %q{
  In order to comment
  As an user
  I want to CRUD own and view foreign comments
} do

  scenario "Comments list on the release page" do
    release = Fabricate(:release)
    2.times { Fabricate(:comment, commentable: release) }
    visit release_path(release)

    page.should have_content(release.comments.first.content)
    page.should have_content(release.comments.last.content)
  end

  scenario "Comments list on the post page" do
    blog_post = Fabricate(:post)
    2.times { Fabricate(:comment, commentable: blog_post) }
    visit post_path(blog_post)

    page.should have_content(blog_post.comments.first.content)
    page.should have_content(blog_post.comments.last.content)
  end

  scenario "Create valid comment" do
    release = Fabricate(:release)
    comment_text = Faker::Lorem.paragraph

    visit release_path(release)

    fill_in 'comment_content', :with => comment_text
    click_button 'Create Comment'

    page.should have_css("#flash_notice", text: 'Comment was successfully created.')
    page.should have_content(comment_text)
  end

  scenario "Delete comment" do
    release = Fabricate(:release)
    comment_text = Faker::Lorem.paragraph
    Fabricate(:comment, commentable: release, content: comment_text)

    visit release_path(release)

    within("#comments") { click_link 'Delete' }

    page.should have_css("#flash_notice", text: 'Comment was successfully destroyed.')
    page.should have_no_content(comment_text)
  end

  scenario "Edit comment" do
    release = Fabricate(:release)
    comment_text = Faker::Lorem.paragraph
    Fabricate(:comment, commentable: release)

    visit release_path(release)

    within("#comments") { click_link 'Edit' }

    fill_in 'comment_content', :with => comment_text
    click_button 'Update Comment'

    page.should have_css("#flash_notice", text: 'Comment was successfully updated.')
    page.should have_content(comment_text)
  end
end
