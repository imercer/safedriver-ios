import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
  
  let locationManager = CLLocationManager()

    @IBOutlet weak var webView: UIWebView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // Ask for permission for notifications
    let notificationSettings = UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert, categories: nil)
    UIApplication.sharedApplication().registerForRemoteNotifications()
    UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    
    // Ask for permission for location
    locationManager.delegate = self
    locationManager.requestAlwaysAuthorization()
    
    // Load up webview
    let url = NSURL(string: "http://app.safedriver.org.nz")
    let request = NSURLRequest(URL: url!)
    webView.loadRequest(request)
  }

 
}

