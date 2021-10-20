When('User click on Log In button') do
    login.lbl_login.click
end

When('User write the user {string}') do |username|
    login.txt_user.set username
end

When('User write the password {string}') do |password|
    login.txt_password.set password
end

When('User click on Login') do
    login.btn_login.click
end

Then('User check the label {string}') do |user_name|
    expect(login.wait_until_lbl_username_visible).to be_truthy
    expect(login.lbl_username).to have_content(user_name)
end

Then('User validate the message error {string}') do |message_error|
    sleep 2
    expect(page.driver.browser.switch_to.alert.text).to have_content(message_error)
end