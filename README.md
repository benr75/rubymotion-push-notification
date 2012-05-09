RubyMotion Push Notification Example
===================

Setup
-----

1. Configure an application to recieve push notifications using the iOS Provisioning Portal
2. Copy Rakefile.example to Rakefile and fill in with the values for your application
3. Run 'rake device' to put the device on your application, it will display a push notification token in an alert view, it also logs it to the console
4. Run the ruby script in the scripts directory, place your push notification PEM file (exported from your keychain in p12, converted to PEM) to send a push.

        ruby push.rb '{"aps":{"sound":"chime","badge":128,"alert":"This is test message from ruby"}}' DEVICETOKEN PEMFILE