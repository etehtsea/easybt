Feature: Manage posts
  In order to manage blog
  As an admin
  I want to manage posts
  
  Scenario: Add new post
    Given I am on the new post page
    When I fill in "Title" with "title 1"
    And I fill in "Body" with "body 1"
    And I press "Create"
    Then I should see "title 1"
    And I should see "body 1"

  Scenario: Delete post
    Given the following posts:
      |title|body|
      |title 1|body 1|
      |title 2|body 2|
      |title 3|body 3|
      |title 4|body 4|
    When I delete the 3rd post
    Then I should see the following posts:
      |Title|Body|
      |title 1|body 1|
      |title 2|body 2|
      |title 4|body 4|
