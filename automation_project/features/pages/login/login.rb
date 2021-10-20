# frozen_string_literal: true

class Login < SitePrism::Page
    element :lbl_login, :xpath,'/html/body/nav/div[1]/ul/li[5]/a'
    element :txt_user, '#loginusername'
    element :txt_password, '#loginpassword'
    element :btn_login, 'button[class="btn btn-primary"]'
    element :lbl_username, '#nameofuser'
end