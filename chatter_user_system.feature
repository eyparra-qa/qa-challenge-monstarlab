Feature: Proposed scenarios to ensure the functionality of the Chatter application
    # Role: User Chat System - US
    # - Search friends to chat
    # - Chat with users
    # - Chat history
    # - Edit messages
    # - Delete messages
    # - Message notifications
    #   * Redirection Link to the current chat
    # - Notify messages offensive

    Background: Preconditions
        Given User navigates to "Chatter application"

    Scenario: Role US - Search friends to chat
        Given User logon on Chatter with correct credentials
        When User type a friend to chat "friend 1"
        Then User can see the previous chat with "friend 1"

    Scenario: Role US - Search a no friend to chat
        Given User logon on Chatter with correct credentials
        When User type a friend to chat "friend 2"
        Then User validate the message error "The friend 2 not exist in your friend list"

    Scenario: Role US - clicking on a pre-existing thread to resume that chat
        Given User logon on Chatter with correct credentials
        When User type a friend to chat "friend 1"
        And User clicking on a pre-existing thread to resume that Chat
        Then User can view previous conversation


    Scenario Outline: Role US - Send information into chat
        Given User logon on Chatter with correct credentials
        When User type a friend to chat "friend 1"
        And User send the info "<info>"
        Then User can see the information correctly "<expected>"

    Example:
            | info                    | expected                |
            | Hi Friend 1, how are u? | Hi Friend 1, how are u? |
            | 😀                      | 😀                      |
            | current location        | street 2                |

    Scenario: Role US - Show messages in chronological order
        Given User logon on Chatter with correct credentials
        When User type a friend to chat "friend 1"
        Then User validate messages in chronological order
            | Hi Friend 1, how are u? |
            | are u there?            |
            | Hey Friend 1            |
            | Hey what´s Up           |

    Scenario: Role US - User edit a message
        Given User logon on Chatter with correct credentials
        When User type a friend to chat "friend 1"
        And User type message "wrong message"
        And User edit the previous message to "hey again!"
        Then User validate that the new message is "hey again!"

    Scenario: Role US - User delete a message
        Given User logon on Chatter with correct credentials
        When User type a friend to chat "friend 1"
        And User search a message "hey again!"
        And User delete the message "hey again!"
        Then User validate that the message was removed

    Scenario: Role US - User check notification and redirection link
        When User logon on Chatter with user 1 "user@mailinator.com"
        And User type a friend to chat "user.notifications"
        And User type message "hey, this is a notification"
        And User logout of the application
        And User logon on Chatter with user 2 "user.notifications@mailinator.com"
        And User check the new message notification
        And User click on the notification
        Then User is redirected to chat with user 1
        And User saw the message "hey, this is a notification"

    Scenario: Role Us - User try to send a bad word
        Given User logon on Chatter with correct credentials
        When User type a friend to chat "friend 1"
        And User type message "bad word"
        Then User validate the message error "No foul language are allowed"

    Scenario: Role Us - User flag a bad word
        When User logon on Chatter with user 2 "user.notifications@mailinator.com"
        And User type a friend to chat "user"
        And User forcibly sends a bad word "bad word"
        And User logout of the application
        And User logon on Chatter with user 1 "user@mailinator.com"
        And User check the new message notification
        And User click on the notification
        And User is redirected to chat with the user
        And User flag a bad word
        Then The bad word is marked in the system