Feature: Proposed scenarios to ensure the functionality of the Chatter application
    # Functionalities
    # Role: User Management - UM
    # - Login
    # - home
    # - User creation
    # - Recover password
    # - Password change
    # - Control foul language as a username
    # - Control offensive content to be moderate

    Background: Preconditions
        Given User navigates to "Chatter application"

    Scenario: Role UM - Wrong Login
        Given User fill wrong credentials
        Then User check message "no account found"

    Scenario: Role UM - Correct Login
        Given User fill a correct username and passwrod
        Then User is on the home page

    Scenario: Role UM - Create a new user
        Given User navigates to create a new account
        When User type a username "edwin.parra"
        And User type the email "edwin.parra@mailinator.com"
        And User type a password "Password@1"
        And User confirm typing the password "Password@1"
        Then User create a new Account successfull

    Scenario: Role UM - Create a new user with a username that already exist
        Given User navigates to create a new account
        When User type a username "edwin.parra"
        Then User validate that message error "The username already exist"

    Scenario Outline: Role UM - Create a new user with wrong email
        Given User navigates to create a new account
        When User type a wrong email format "<email>"
        Then User validate that message error "Email with wrong format"

    Example:
            | email         |
            | .@            |
            | asd@.com      |
            | .com          |
            | prueba@prueba |
            | .com@prueba   |

    Scenario: Role UM - Create a new user and Ensure my password is at least 16 characters
        Given User navigates to create a new account
        When User type a wrong email format "1"
        Then User validate that message error "Password must be at least 16 characters"

    Scenario: Role UM - Forgot password with invalid email
        Given User navigates to forgot password
        When User type worng email "wrong.user@mailinator.com"
        Then User check message "no account found"

    Scenario: Role UM - Forgot password with valid email
        Given User navigates to forgot password
        When User type a valid email "edwin.parra@mailinator.com"
        And User check if the email was received via API call
        And User navigates to login page
        And User type a valid email "edwin.parra@mailinator.com"
        And User type the new password that got from the email
        Then User is on the home page

    Scenario Outline: Role UM - Ensure that no foul language is used as a username
        Given User navigates to create a new account
        When User type a username "<bad_word>"
        And User type the email "bad.word.user@mailinator.com"
        And User type a password "Password@1"
        And User confirm typing the password "Password@1"
        Then User validate that message error "You can't use that username"

    Example:
            | bad_word  |
            | bad_word1 |
            | bad_word2 |
            | bad_word3 |
            | bad_word4 |
            | bad_word5 |

    Scenario: Role UM - Change a password with wrong old password
        Given User logon on Chatter with correct credentials
        And User navigates to change password
        When User type wrong old password "Password@2"
        And User type new password "Password@2"
        Then User check message "Wrong old password"

    Scenario: Role UM - Change a password with wrong old password
        Given User logon on Chatter with correct credentials
        And User navigates to change password
        When User type wrong old password "Password@1"
        And User type new password "Password@2"
        Then User check if the email was received via API call

    Scenario Outline: Role UM - User try to change nickname
        Given User logon on Chatter with correct credentials
        And User navidates to profile info
        When User type a nick name "<nick_name>"
        Then User validate the message "<message>"

    Example:
            | nick_name   | message                           |
            | edwin.parra | The nick name already exist       |
            | new_nick    | Nickname was changed successfully |

    Scenario Outline: Role UM - User validate first name field
        Given User logon on Chatter with correct credentials
        And User navidates to profile info
        When User type the first name "<first_name>"
        Then User validate the message error "<error_message>"

    Example:
            | first_name      | error_message                                   |
            | 123             | Only type letters                               |
            | ###             | Only type letters                               |
            | 1               | First name should contain at least 3 letters    |
            | asdfghjklkjhgfd | First name should contain least than 10 letters |

    Scenario Outline: Role UM - User validate last name field
        Given User logon on Chatter with correct credentials
        And User navidates to profile info
        When User type the last name "<last_name>"
        Then User validate the message error "<error_message>"

    Example:
            | last_name       | error_message                                  |
            | 123             | Only type letters                              |
            | ###             | Only type letters                              |
            | 1               | Last name should contain at least 3 letters    |
            | asdfghjklkjhgfd | last name should contain least than 10 letters |

    Scenario Outline: Role UM - User validate phone number field
        Given User logon on Chatter with correct credentials
        And User navidates to profile info
        When User type the phone number "<phone>"
        Then User validate the message error "<error_message>"

    Example:
            | phone           | error_message                                  |
            | 3203405678      | The phone number already exist                 |
            | ###             | Only type numbers                              |
            | 1               | Last name should contain at least 7 numbers    |
            | asdfghjklkjhgfd | last name should contain least than 10 numbers |