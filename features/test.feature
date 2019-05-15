Feature: Admin

  Scenario: Login and view the resources aviable for Admin

    Given I am a admin
    When I am sign in
    Then I should view Admin Page
    Then I should see list of posts
    When I click on new post
    Then I should visit add of post
    When I click on Batch Book
    Then I should visit Batchbook Page
    When I Click on Log out
    Then I should be redirect to Login page


  Scenario: Adding new post

    Given I am a admin
    And I am sign in
    Then I should view Admin Page
    When I click on add post button
    Then I should redirect to new post page
    When I click on new post
    Then I should add the new post to the aviable posts
    Then I should see successfull addition of post

  Scenario: View the post

    Given I am a admin
    And I am sign in
    Then I should view Admin Page
    When I click on show post
    Then I should view the post


  Scenario: View the comments to the post

    Given I am a admin
    And I am sign in
    Then I should view Admin Page
    When I click on show post
    Then I should view the post
    Then I should see the comments to the post


  Scenario: Adding comments to the post

    Given I am a admin
    And  I am sign in
    Then I should view Admin Page
    When I click on show post
    Then I should view the post
    When I click on comment
    Then I should see comment added to the post

  Scenario: Editing the post

    Given I am a admin
    And I am sign in
    Then I should view Admin Page
    When I click on edit post
    Then I should see the edit post page
    When I click on update post
    Then I should see the updated post

  Scenario: Add Batch Book

    Given I am a admin
    And I am sign in
    Then I should view Admin Page
    When I click on Batch Book
    Then I should visit Batchbook Page
    When I click on create Batchbook
    Then I should see student registration page
    When I add student
    Then I have to see inserted students details


  Scenario: View the Pending List of Batchbook

    Given I am a admin
    And I am sign in
    Then I should view Admin Page
    When I click on Batch Book
    Then I should visit Batchbook Page
    When I click on Pendig Batchbook list
    Then I should see the pending list of BatchBook


  Scenario: View the Due Batchbook list

    Given I am a admin
    And I am sign in
    Then I should view Admin Page
    When I click on Batch Book
    Then I should visit Batchbook Page
    When I click on Due Batchbook list
    Then I should see the due list of BatchBook

  Scenario: View the Completed Batchbook list

    Given I am a admin
    And I am sign in
    Then I should view Admin Page
    When I click on Batch Book
    Then I should visit Batchbook Page
    When I click on Complete Batchbook list
    Then I should see the completed list of BatchBook


  Scenario: Search the student with the student id

    Given I am a admin
    And I am sign in
    Then I should view Admin Page
    When I click on Batch Book
    Then I should visit Batchbook Page
    Then I should to enter the studentid
    When I click on search student
    Then I should see given student details


  Scenario: Search Student with the batch name

    Given I am a admin
    And I am sign in
    Then I should view Admin Page
    When I click on Batch Book
    Then I should visit Batchbook Page
    Then I should select the batchname
    When I click on search
    Then I should see given student details

  Scenario: Admin Log out

    Given I am a admin
    And I am sign in
    Then I should view Admin Page
    When I Click on Log out
    Then I should be redirect to Login page

  Scenario: Add task to a student
    Given I am a Admin

    When I visit the User profile
    Then I should see a link for show detail of user
    When I click the link to show
    Then I should see the details of user
    And I should see link to add task
    When I click the link add task
    Then I should new assign task page
    Then I want to add a task to the user


  Scenario: Add Equipment
    Given I am a Admin
    When I visit equipment page
    Then I should See link for new equipment
    Then I click link to add new equipment
    Then I want to add equipment
