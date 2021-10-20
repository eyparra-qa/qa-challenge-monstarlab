Feature: Validate some scenarios on the page demoblaze

    Background:
        Given User navigates to demoblaze page

    Scenario: Check on the home page the laptop
        When User clicks on laptops tap
        Then User validate that the first item is "Sony vaio i5"
        And User validate that the price is "$790"

    Scenario: Login into demoblaze
        When User click on Log In button
        And User write the user "admin"
        And User write the password "admin"
        And User click on Login
        Then User check the label "Welcome admin"

    Scenario: Login with wrong credentials into demoblaze
        When User click on Log In button
        And User write the user "Admin"
        And User write the password "something"
        And User click on Login
        Then User validate the message error "Wrong password."