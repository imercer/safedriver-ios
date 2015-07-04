import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    if launchOptions?[UIApplicationLaunchOptionsLocationKey] != nil {
      println("It's a location event")
    }
    
    UIApplication.sharedApplication().statusBarHidden = false
    UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    //UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
    return true
  }
  
  func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
    println("\(notification)")
    if notification.region != nil {
      println("It's a location notification!")
    }
  }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        let tokenChars = UnsafePointer<CChar>(deviceToken.bytes)
        var tokenString = ""
        
        for var i = 0; i < deviceToken.length; i++ {
            tokenString += String(format: "%02.2hhx", arguments: [tokenChars[i]])
        }
        println("tokenString: \(tokenString)")
        let urlPath = "http://app.safedriver.org.nz/push/register.php?deviceToken=\(tokenString)"
        let url = NSURL(string: urlPath)
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
        
    }
    
}

