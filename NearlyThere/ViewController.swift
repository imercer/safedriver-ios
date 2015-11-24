import UIKit
import CoreLocation
import iAd
import WebKit

class ViewController: UIViewController, CLLocationManagerDelegate {
  
  let locationManager = CLLocationManager()
    
    @IBOutlet var webView: UIWebView!

    

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // Ask for permission for notifications
    let notificationSettings = UIUserNotificationSettings(forTypes: [UIUserNotificationType.Alert, UIUserNotificationType.Sound], categories: nil)
    UIApplication.sharedApplication().registerForRemoteNotifications()
    UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    UIApplication.sharedApplication().cancelAllLocalNotifications()
    
    // Ask for permission for location
    locationManager.delegate = self
    locationManager.requestAlwaysAuthorization()
    
    // Load up webview
    let url = NSURL (string: "http://app.safedriver.org.nz");
    let requestObj = NSURLRequest(URL: url!);
    webView.loadRequest(requestObj);
    
    //Regular Alerts
    let leftNotification1:UILocalNotification = UILocalNotification()
    leftNotification1.alertBody = "Keep Left on all New Zealand Roads"
    leftNotification1.repeatInterval = NSCalendarUnit.Hour
    leftNotification1.soundName = "left.mp3"
    leftNotification1.fireDate = NSDate(timeIntervalSinceNow: 900)
    UIApplication.sharedApplication().scheduleLocalNotification(leftNotification1)
    
    let slowNotification:UILocalNotification = UILocalNotification()
    slowNotification.alertBody = "Slow Down when approaching corners"
    slowNotification.repeatInterval = NSCalendarUnit.Hour
    slowNotification.soundName = "corners.mp3"
    slowNotification.fireDate = NSDate(timeIntervalSinceNow: 1800)
    UIApplication.sharedApplication().scheduleLocalNotification(slowNotification)
    
    let pullover:UILocalNotification = UILocalNotification()
    pullover.alertBody = "Pull over before taking photographs"
    pullover.repeatInterval = NSCalendarUnit.Hour
    pullover.soundName = "pullover.mp3"
    pullover.fireDate = NSDate(timeIntervalSinceNow: 2700)
    UIApplication.sharedApplication().scheduleLocalNotification(pullover)
    
    let wetandicy:UILocalNotification = UILocalNotification()
    wetandicy.alertBody = "Slow Down on Wet and Icy Roads"
    wetandicy.repeatInterval = NSCalendarUnit.Hour
    wetandicy.soundName = "wetandicy.mp3"
    wetandicy.fireDate = NSDate(timeIntervalSinceNow: 3600)
    UIApplication.sharedApplication().scheduleLocalNotification(wetandicy)
    
    /*
    let BaseCrown = UILocalNotification()
    BaseCrown.alertBody = "You have entered a high risk zone (Crown Range Road) , proceed with caution"
    BaseCrown.regionTriggersOnce = true
    BaseCrown.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -44.97681, longitude: 168.863223), radius: 1000.0, identifier: "Location1")
    BaseCrown.region!.notifyOnExit = false
    BaseCrown.soundName = "crownrange.mp3"
    UIApplication.sharedApplication().scheduleLocalNotification(BaseCrown)
    
    let Cadrona = UILocalNotification()
    Cadrona.alertBody = "You have entered a high risk zone (Crown Range Road) , proceed with caution"
    Cadrona.regionTriggersOnce = true
    Cadrona.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -44.89228, longitude: 168.994017), radius: 1000.0, identifier: "Location2")
    Cadrona.region!.notifyOnEntry = false
    Cadrona.soundName = "crownrange.mp3"
    UIApplication.sharedApplication().scheduleLocalNotification(Cadrona)
    
    let OutsideKGorge = UILocalNotification()
    OutsideKGorge.alertBody = "You have entered a high risk zone (Kawarau Gorge Road) , proceed with caution"
    OutsideKGorge.regionTriggersOnce = true
    OutsideKGorge.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -45.049776, longitude: 169.032084), radius: 1000.0, identifier: "Location3")
    OutsideKGorge.region!.notifyOnExit = false
    OutsideKGorge.soundName = "kgorgeextended.mp3"
    UIApplication.sharedApplication().scheduleLocalNotification(OutsideKGorge)
    
    let MilfordAvalanche = UILocalNotification()
    MilfordAvalanche.alertBody = "Do not stop within this high avalanche risk area."
    MilfordAvalanche.regionTriggersOnce = true
    MilfordAvalanche.soundName = "avalanche.mp3"
    MilfordAvalanche.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -44.775014, longitude: 168.006457), radius: 10000.0, identifier: "Location4")
    MilfordAvalanche.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(MilfordAvalanche)
    
    let HomerTunnel = UILocalNotification()
    HomerTunnel.alertBody = "Turn on your lights when inside the homer tunnel."
    HomerTunnel.regionTriggersOnce = true
    HomerTunnel.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -44.764211, longitude: 167.981193), radius: 1000.0, identifier: "Location5")
    HomerTunnel.region!.notifyOnExit = false
    HomerTunnel.soundName = "homer.mp3"
    UIApplication.sharedApplication().scheduleLocalNotification(HomerTunnel)
    
    let MilfordRoad = UILocalNotification()
    MilfordRoad.alertBody = "You have entered a high risk zone (Milford Road) , proceed with caution. There is no fuel beyond this point."
    MilfordRoad.regionTriggersOnce = true
    MilfordRoad.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -45.406867, longitude: 167.746012), radius: 1000.0, identifier: "Location6")
    MilfordRoad.region!.notifyOnExit = false
    MilfordRoad.soundName = "milfordroadshortened.mp3"
    UIApplication.sharedApplication().scheduleLocalNotification(MilfordRoad)
    
    let DevilsStaircase = UILocalNotification()
    DevilsStaircase.alertBody = "You have entered a high risk zone (Devils Staircase) , proceed with caution"
    DevilsStaircase.regionTriggersOnce = true
    DevilsStaircase.soundName = "devilsstaircase.mp3"
    DevilsStaircase.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -45.199407, longitude: 168.742583), radius: 10000.0, identifier: "Location7")
    DevilsStaircase.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(DevilsStaircase)
    
    let DesertRoad = UILocalNotification()
    DesertRoad.alertBody = "You have entered a high risk zone (Desert Road) , proceed with caution."
    DesertRoad.regionTriggersOnce = true
    DesertRoad.soundName = "desertroad.mp3"
    DesertRoad.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -39.267437, longitude: 175.736685), radius: 25000.0, identifier: "Location8")
    DesertRoad.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(DesertRoad)
    
    let HaurakiPlains = UILocalNotification()
    HaurakiPlains.alertBody = "You have entered a high risk zone (Hauraki Plains) , proceed with caution."
    HaurakiPlains.regionTriggersOnce = true
    HaurakiPlains.soundName = "haurakiplains.mp3"
    HaurakiPlains.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -37.246316, longitude: 175.199842), radius: 12000.0, identifier: "Location9")
    HaurakiPlains.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(HaurakiPlains)
    
    let KaimaiRanges = UILocalNotification()
    KaimaiRanges.alertBody = "You have entered a high risk zone (Kaimai Ranges) , proceed with caution."
    KaimaiRanges.regionTriggersOnce = true
    KaimaiRanges.soundName = "kaimai.mp3"
    KaimaiRanges.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -37.825720, longitude: 175.996133), radius: 10000.0, identifier: "Location10")
    KaimaiRanges.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(KaimaiRanges)
    
    let Karangahake = UILocalNotification()
    Karangahake.alertBody = "You have entered a high risk zone (Karangahake Gorge) , proceed with caution."
    Karangahake.regionTriggersOnce = true
    Karangahake.soundName = "karangaheke.mp3"
    Karangahake.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -37.418901, longitude: 175.742572), radius: 3000.0, identifier: "Location11")
    Karangahake.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(Karangahake)

    let LindisPass = UILocalNotification()
    LindisPass.alertBody = "You have entered a high risk zone (Lindis Pass) , proceed with caution."
    LindisPass.regionTriggersOnce = true
    LindisPass.soundName = "lindispass.mp3"
    LindisPass.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -44.585636, longitude: 169.643528), radius: 37000.0, identifier: "Location12")
    LindisPass.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(LindisPass)
    
    let RimutakaHill = UILocalNotification()
    RimutakaHill.alertBody = "You have entered a high risk zone (Rimutaka Hill Road) , proceed with caution."
    RimutakaHill.regionTriggersOnce = true
    RimutakaHill.soundName = "rimutakahill.mp3"
    RimutakaHill.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -41.109769, longitude: 175.253011), radius: 5000.0, identifier: "Location13")
    RimutakaHill.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(RimutakaHill)
    
    let NapierTaupo = UILocalNotification()
    NapierTaupo.alertBody = "You have entered a high risk zone (Napier-Taupo Road) , proceed with caution."
    NapierTaupo.regionTriggersOnce = true
    NapierTaupo.soundName = "napiertaupo.mp3"
    NapierTaupo.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -39.117149, longitude: 176.581215), radius: 30000.0, identifier: "Location14")
    NapierTaupo.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(NapierTaupo)
    
    let DomeValley = UILocalNotification()
    DomeValley.alertBody = "You have entered a high risk zone (Dome Valley) , proceed with caution."
    DomeValley.regionTriggersOnce = true
    DomeValley.soundName = "domevalley.mp3"
    DomeValley.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -36.361306, longitude: 174.606477), radius: 6000.0, identifier: "Location15")
    DomeValley.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(DomeValley)
    
    let Brynderwyn = UILocalNotification()
    Brynderwyn.alertBody = "You have entered a high risk zone (Brynderwyn Hills) , proceed with caution."
    Brynderwyn.regionTriggersOnce = true
    Brynderwyn.soundName = "brynderwyns.mp3"
    Brynderwyn.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -36.069030, longitude: 174.421383), radius: 2600.0, identifier: "Location16")
    Brynderwyn.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(Brynderwyn)

    let CMJ = UILocalNotification()
    CMJ.alertBody = "Expect Merging Traffic"
    CMJ.regionTriggersOnce = true
    CMJ.soundName = "cmj.mp3"
    CMJ.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -36.86038, longitude: 174.76003), radius: 800.0, identifier: "Location17")
    CMJ.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(CMJ)
    
    let HarbourBridge = UILocalNotification()
    HarbourBridge.alertBody = "Watch your following distances on Auckland Motorways."
    HarbourBridge.regionTriggersOnce = true
    HarbourBridge.soundName = "aklharbourbridge.mp3"
    HarbourBridge.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -36.830166, longitude: 174.746019), radius: 1400.0, identifier: "Location18")
    HarbourBridge.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(HarbourBridge)
    
    let JohnstonsHillTunnels = UILocalNotification()
    JohnstonsHillTunnels.alertBody = "Watch your following distances on Auckland Motorways."
    JohnstonsHillTunnels.regionTriggersOnce = true
    JohnstonsHillTunnels.soundName = "followingdistances.mp3"
    JohnstonsHillTunnels.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -36.535894, longitude: 174.680456), radius: 300.0, identifier: "Location19")
    JohnstonsHillTunnels.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(JohnstonsHillTunnels)
    
    let VicParkTunnel = UILocalNotification()
    VicParkTunnel.alertBody = "Watch your following distances on Auckland Motorways."
    VicParkTunnel.regionTriggersOnce = true
    VicParkTunnel.soundName = "vicparktunnel.mp3"
    VicParkTunnel.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:
        -36.849391, longitude: 174.753123), radius: 10.0, identifier: "Location20")
    VicParkTunnel.region!.notifyOnExit = false
    UIApplication.sharedApplication().scheduleLocalNotification(VicParkTunnel)
    */
  }
 
}

