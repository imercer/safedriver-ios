import UIKit
import CoreLocation
import iAd

class ViewController: UIViewController, CLLocationManagerDelegate, ADBannerViewDelegate {
  
  let locationManager = CLLocationManager()
    
    var bannerView:ADBannerView?

    @IBOutlet weak var webView: UIWebView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // Ask for permission for notifications
    let notificationSettings = UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert|UIUserNotificationType.Sound, categories: nil)
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
    
    self.canDisplayBannerAds = true
    self.bannerView?.delegate = self
    self.bannerView?.hidden = true
    
    //Regular Alerts
    var leftNotification1:UILocalNotification = UILocalNotification()
    leftNotification1.alertBody = "Keep Left on all New Zealand Roads"
    leftNotification1.repeatInterval = NSCalendarUnit.CalendarUnitHour
    leftNotification1.soundName = "left.mp3"
    leftNotification1.fireDate = NSDate(timeIntervalSinceNow: 900)
    UIApplication.sharedApplication().scheduleLocalNotification(leftNotification1)
    
    var slowNotification:UILocalNotification = UILocalNotification()
    slowNotification.alertBody = "Slow Down when approaching corners"
    slowNotification.repeatInterval = NSCalendarUnit.CalendarUnitHour
    slowNotification.soundName = "slow.mp3"
    slowNotification.fireDate = NSDate(timeIntervalSinceNow: 1800)
    UIApplication.sharedApplication().scheduleLocalNotification(slowNotification)
    
    var overtaking:UILocalNotification = UILocalNotification()
    overtaking.alertBody = "Do Not Overtake near corners and intersections"
    overtaking.repeatInterval = NSCalendarUnit.CalendarUnitHour
    overtaking.soundName = "overtaking.mp3"
    overtaking.fireDate = NSDate(timeIntervalSinceNow: 2700)
    UIApplication.sharedApplication().scheduleLocalNotification(overtaking)
    
    var wetandicy:UILocalNotification = UILocalNotification()
    wetandicy.alertBody = "Slow Down on Wet and Icy Roads"
    wetandicy.repeatInterval = NSCalendarUnit.CalendarUnitHour
    wetandicy.soundName = "wetandicy.mp3"
    wetandicy.fireDate = NSDate(timeIntervalSinceNow: 3600)
    UIApplication.sharedApplication().scheduleLocalNotification(wetandicy)
    
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
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.bannerView?.hidden = false
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.bannerView?.hidden = true
    }
 
}

