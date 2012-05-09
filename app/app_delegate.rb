class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    UIApplication.sharedApplication.registerForRemoteNotificationTypes(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)
    UIApplication.sharedApplication.applicationIconBadgeNumber = 0;
    true
  end

  #- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
  def application(application, didRegisterForRemoteNotificationsWithDeviceToken:deviceToken)
    clean_token = deviceToken.description.gsub(" ", "").gsub("<", "").gsub(">", "")
    
    # Log the push notification to the console
    puts clean_token
    
    show_alert("Push Notification Token", clean_token)
  end

  #- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
  def application(application, didReceiveRemoteNotification:userInfo)
    show_alert("Push Notification Received", "Alert: #{userInfo['aps']['alert']}\n\nSound:#{userInfo['aps']['sound']}\n\nBadge: #{userInfo['aps']['badge']}")
  end

  #- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
  def application(application, didFailToRegisterForRemoteNotificationsWithError:error)
    # Failed to register for push notifications
  end

  def show_alert(title, message)
    alert = UIAlertView.new
    alert.title = title
    alert.message = message
    alert.show
  end

end
