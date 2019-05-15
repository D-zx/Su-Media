Given(/^I am a admin$/)do
  @user = FactoryGirl.create :admin
end
When(/^I am sign in$/)do
  @user = FactoryGirl.create :signin
  visit '/'
  fill_in 'user[email]', with: @user.email
  fill_in 'user[password]', with: @user.password
  click_button 'Log in'
end
Then(/^I should view Admin Page$/)do
  visit '/'
end
Then(/^I should see list of posts$/)do
  expect(page).to have_content "Posts"
end
When(/^I click on new post$/)do
  visit '/'
  find_link('New Post', href: new_post_path).click
end
Then(/^I should visit add of post$/)do
  visit '/posts/new'
end
When(/^I click on Batch Book$/)do
  visit '/'
  find_link('Batch Book', href: adminmain_path).click
end
Then(/^I should visit Batchbook Page$/)do
  visit '/home/adminmain'
end
When(/^I Click on Log out$/)do
  find_link('Sign out',href:'/users/sign_out').click
end
Then(/^I should be redirect to Login page$/)do
  visit '/users/sign_in'
end
#When(/^I should see list of students$/)do
# visit '/home/adminmain'
#save_and_open_page
# click_button 'search'
#find_link('search', href: project_path(@project)).click
#expect(page).to have_content "Search: #{@project.name}"
#end




When(/^I click on add post$/)do
  visit '/'
  find_link('New Post',href:'/posts/new').click
end
Then(/^I should redirect to new post page$/)do
  visit '/posts/new'
end
When (/^I click on add post button$/)do
  visit '/posts/new'
  @post = FactoryGirl.create :post
  fill_in "post[name]",with:@post.name
  fill_in "post[description]",with:@post.description
  #click_button('Create Post')
end
Then (/^I should add the new post to the aviable posts$/)do
  visit '/posts'
end
Then (/^I should see successfull addition of post$/)do
  visit '/posts'
end





When (/^I click on create Batchbook$/)do
  click_button('Add BatchBook')
  #find_link('Batch Book',href:"/home/adminmain").click
end
Then (/^I should see student registration page$/)do
  @batchbook = FactoryGirl.create :batchbook
  expect(page).to have_content('BatchBook Name')
  fill_in 'expirydate',with:@batchbook.expirydate
  click_button('Create')
end
When (/^I add student$/)do
  visit '/home/index'

  @batchbook = FactoryGirl.create :batchbook
  fill_in 'studentid',with:@batchbook.studentid
  fill_in 'studentname',with:@batchbook.studentname
  fill_in 'fos',with:@batchbook.fos
  click_button('Insert')
end

Then (/^I have to see inserted students details$/)do
  visit '/home/pendingbatch'
end

When (/^I click on Pendig Batchbook list$/)do

  find_link('Pending List',href:'/home/pendingbatch').click
  ##save_and_open_page
end

Then (/^I should see the pending list of BatchBook$/)do
  expect(page).to have_content('Pending List')
end



When (/^I click on Complete Batchbook list$/)do
  find_link('Books Completed',href:'/home/batchlist').click
end
Then (/^I should see the completed list of BatchBook$/)do
  expect(page).to have_content('Completed List')
end


When (/^I click on Due Batchbook list$/)do
  find_link('Due List',href:'/home/duebatchbook').click
end
Then (/^I should see the due list of BatchBook$/)do
  expect(page).to have_content('Due List')
end


Then (/^I should to enter the studentid$/)do
  @batchbook = FactoryGirl.create :batchbook
  fill_in 'studentid',with:@batchbook.studentid
end

When (/^I click on search student$/)do
  # within('#givenid')do


  #end
  within('search')do
    #find('select').find(:xpath, 'option[1]').select_option
    click_button('Search')
    ##save_and_open_page
  end
end
Then (/^I should see given student details$/)do
  expect(page).to have_content('Details')
  #save_and_open_page
end



Then (/^I should select the batchname$/)do
  within('searchbatch')do
    find('select').find(:xpath,'option[1]').select_option
  end
end

When (/^I click on search$/)do
  within('searchbatch')do
    click_button('Search')
  end
end


When (/^I click on show post$/)do
  @post1 = FactoryGirl.create :post1
  visit '/posts/new'
  fill_in 'post[name]',with:'Meeting'
  fill_in 'post[description]',with:'All have to attend!!!!'
  attach_file('post[image]', File.absolute_path('image.jpg'))
  click_button('Create Post')
  #save_and_open_page
end

Then (/^I should view the post$/)do
  visit '/posts/1'
  ##save_and_open_page
end

Then (/^I should see the comments to the post$/)do
  expect(page).to have_content('Comments')
end


When (/^I click on comment$/)do
  fill_in 'comment[content]',with:'Hello'
  click_button('Create Comment')
end

Then (/^I should see comment added to the post$/)do
  expect(page).to have_content('Hello')
end

When (/^I click on edit post$/)do
  @post1 = FactoryGirl.create :post1
  visit '/posts/1/edit'
  #find_link('Edit', href: '/posts/1/edit').click
end

Then (/^I should see the edit post page$/)do
  expect(page).to have_content('Editing Post')
end
When (/^I click on update post$/)do
  fill_in 'post[name]',with:'abcd'
  fill_in 'post[description]',with:'12345'
  click_button('Update Post')
end
Then (/^I should see the updated post$/)do
  expect(page).to have_content('Successfully updated post')
end


Given(/^I am a Admin$/) do
  @user = FactoryGirl.create :admin1
end

Given(/^I am signed in$/) do
  visit '/d/users/sign_in/'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end
When(/^I visit the User profile$/) do
  visit '/task/index'
end
Then(/^I should see a link for show detail of user$/) do
  ##save_and_open_page
  page.should have_selector(:link_or_button, 'Show')
end
When(/^I click the link to show$/) do
  click_button('Show')
end
Then(/^I should see the details of user$/) do
  ##save_and_open_page
end
Then(/^I should see link to add task$/) do
  page.should have_selector(:link_or_button, 'Add task')
end

When(/^I click the link add task$/) do
  click_link('Add task')
end

Then(/^I should new assign task page$/) do
  ##save_and_open_page
end

Then(/^I want to add a task to the user$/)do
  @assign_task = FactoryGirl.build :assign_task
  page.should have_selector(:link_or_button, 'Create Assign task')
  click_button('Create Assign task')
  ##save_and_open_page
end

When(/^I visit equipment page$/)do
  visit '/equipment'
end
Then(/^I should See link for new equipment$/)do
  page.should have_selector(:link_or_button, 'New Equipment')
end
Then(/^I click link to add new equipment$/)do
  click_link('New Equipment')
end


Then(/^I want to add equipment$/)do

  @equipment = FactoryGirl.build :equipment
  page.should have_selector(:link_or_button, 'Create Equipment')
  click_button('Create Equipment')
  ##save_and_open_page
end