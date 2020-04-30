# AdMobApp
Demo app using Google AdMob

## Contents

  - [Configure app](#configure-app)
  - [Configure the add types](#configure-the-add-types)
    - [Bannner Ad](#banner-ad)
    - [Interstitial Ad](#interstitial-ad)
    - [Rewarded Ad](#rewarded-ad)

## Configure app

First of all, to start the application you must run the file <b>DemoProject.xcworkspace</b>

Once we have the workspace open, first we must configure the application ID. To configure the application 
we must open the <b>info.plist</b> file of the main project (AdMobApp) and modify the following line 
(located at the end of the file):
```xml
<key>GADApplicationIdentifier</key>
    <string>ca-app-pub-################~##########</string>
```
We can get the id of our application by registering it in https://admob.google.com

The project is ready to run in a simulator. If we want to modify this behavior,
we must go to the file <b>SSMMobileAds.swift</b> and modify the following line 
(found at the beginning of the file in the configure function):

```swift
#if DEBUG
  GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ kGADSimulatorID as? String  ?? ""]
#endif
```
In the file it will be necessary to change the kGADSimulatorID for your device ID: 

```swift
#if DEBUG
  GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "DeviceID" ]
#endif
```
You can get the id of your device in XCode, after linking it, in the simulators panel, in the device tab.

For the application to run on a real device, it is necessary to apply a requirement.
A version of IOS equal to or greater than 13 is required. There are several bugs in version 13.3, 
so it is recommended to use a version of IOS from 13.4.
  
## Configure the add types

This application supports three types of ads: Banner, Interstitial and Rewarded. 

### Banner Ad

To configure the banner, we must go to the <b>viewController.swift</b> file. 
In the <b>showBanner(_:)</b> function we can modify the banner id and its size.

```swift
///Show banner Add
  @IBAction func showBanner(_ sender: Any) {
    SSMMobileAds.shared.showBanner(with: "ca-app-pub-3940256099942544/2934735716", in: self, with: SSMMobileAds.shared.BigBannerSize)
  }
````

The allowed banner sizes are defined in the adMobLib library and are as follows:

  - CommonBannerSize(320x50): equivalent to kGADAdSizeBanner of AdMob Banner sizes.
  - BigBannerSize(320x100): equivalent to kGADAdSizeLargeBanner of AdMob Banner sizes.
  - MediumBannerSize(300x250): equivalent to kGADAdSizeMediumRectangle of AdMob Banner sizes.
  - FullBannerSize(468x60): equivalent to kGADAdSizeFullBanner of AdMob Banner sizes.
  
by default use the BigBannerSize. 

### Interstitial Ad

To configure the interstitial we must go to the <b>SceneDelegate.swift</b> and <b>AppDelegate.swift</b> files 
and modify the following line:

```swift
 //configure interstitial 
    SSMMobileAds.shared.configure(interstitialID: "ca-app-pub-3940256099942544/5135589807")
```
In this line we will add the interstitial ID. It is done by this way because this type of ads takes time to load, 
so we initialize it at the start of the application.

### Rewarded Ad

To configure the rewarded ad, we must go to the <b>viewController.swift</b> file. 
In the <b>showRewarded(_:)</b> function we can modify the rewarded id.

```swift
///Show rewarded Add
  @IBAction func showRewarded(_ sender: Any) {
    SSMMobileAds.shared.showRewarded(with: "ca-app-pub-3940256099942544/1712485313", in: self)
  }
```
    
