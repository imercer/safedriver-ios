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
    UIApplication.sharedApplication().cancelAllLocalNotifications()
    
    // Ask for permission for location
    locationManager.delegate = self
    locationManager.requestAlwaysAuthorization()
    
    // Load up webview
    let url = NSURL(string: "http://app.safedriver.org.nz")
    let request = NSURLRequest(URL: url!)
    webView.loadRequest(request)
    
    let BaseCrown = UILocalNotification()
    BaseCrown.alertBody = "You have entered a high risk zone (Crown Range Road) , proceed with caution"
    BaseCrown.regionTriggersOnce = false
    BaseCrown.region = CLCircularRegion(circularRegionWithCenter: CLLocationCoordinate2D(latitude:
        -44.97681, longitude: 168.863223), radius: 1000.0, identifier: "Location1")
    BaseCrown.region.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(BaseCrown)
    
    let Cadrona = UILocalNotification()
    Cadrona.alertBody = "You have entered a high risk zone (Crown Range Road) , proceed with caution"
    Cadrona.regionTriggersOnce = false
    Cadrona.region = CLCircularRegion(circularRegionWithCenter: CLLocationCoordinate2D(latitude:
        -44.89228, longitude: 168.994017), radius: 1000.0, identifier: "Location2")
    Cadrona.region.notifyOnEntry = false
    UIApplication.sharedApplication().scheduleLocalNotification(Cadrona)
    
    let OutsideKGorge = UILocalNotification()
    OutsideKGorge.alertBody = "You have entered a high risk zone (Kawarau Gorge Road) , proceed with caution"
    OutsideKGorge.regionTriggersOnce = false
    OutsideKGorge.region = CLCircularRegion(circularRegionWithCenter: CLLocationCoordinate2D(latitude:
        -45.049776, longitude: 169.032084), radius: 1000.0, identifier: "Location3")
    OutsideKGorge.region.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(OutsideKGorge)
    
    let MilfordAvalanche = UILocalNotification()
    MilfordAvalanche.alertBody = "Do Not Stop within this high avalanche risk area."
    MilfordAvalanche.regionTriggersOnce = false
    MilfordAvalanche.region = CLCircularRegion(circularRegionWithCenter: CLLocationCoordinate2D(latitude:
        -44.775014, longitude: 168.006457), radius: 10000.0, identifier: "Location4")
    MilfordAvalanche.region.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(MilfordAvalanche)
    
    let HomerTunnel = UILocalNotification()
    HomerTunnel.alertBody = "Turn on your lights whn inside the homer tunnel."
    HomerTunnel.regionTriggersOnce = false
    HomerTunnel.region = CLCircularRegion(circularRegionWithCenter: CLLocationCoordinate2D(latitude:
        -44.764211, longitude: 167.981193), radius: 1000.0, identifier: "Location5")
    HomerTunnel.region.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(HomerTunnel)
    
    let MilfordRoad = UILocalNotification()
    MilfordRoad.alertBody = "You have entered a high risk zone (Milford Road) , proceed with caution. There is no fuel beyond this point."
    MilfordRoad.regionTriggersOnce = false
    MilfordRoad.region = CLCircularRegion(circularRegionWithCenter: CLLocationCoordinate2D(latitude:
        -45.406867, longitude: 167.746012), radius: 1000.0, identifier: "Location6")
    MilfordRoad.region.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(MilfordRoad)
    
    let DevilsStaircase = UILocalNotification()
    DevilsStaircase.alertBody = "You have entered a high risk zone (Devils Staircase) , proceed with caution. There is no fuel beyond this point."
    DevilsStaircase.regionTriggersOnce = false
    DevilsStaircase.region = CLCircularRegion(circularRegionWithCenter: CLLocationCoordinate2D(latitude:
        -45.199407, longitude: 168.742583), radius: 10000.0, identifier: "Location7")
    DevilsStaircase.region.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(DevilsStaircase)
  }

 
}

