//
//  SSMMobileAds+GADInterstitialViewDelegate.swift
//  AdMobLib
//
//  Created by Susana Santos Moreno on 27/04/2020.
//  Copyright © 2020 Susana Santos Moreno. All rights reserved.
//

import Foundation
import GoogleMobileAds

extension SSMMobileAds: GADInterstitialDelegate {
  
  /// Tells the delegate an ad request succeeded.
  public func interstitialDidReceiveAd(_ ad: GADInterstitial) {
    
  }
  
  /// Tells the delegate an ad request failed.
  public func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
    delegate?.failToReceiveViewAd()
  }
  
  /// Tells the delegate that an interstitial will be presented.
  public func interstitialWillPresentScreen(_ ad: GADInterstitial) {
    delegate?.viewWillPresentScreen()
  }
  
  /// Tells the delegate the interstitial is to be animated off the screen.
  public func interstitialWillDismissScreen(_ ad: GADInterstitial) {
    delegate?.viewWillDismissScreen()
  }
  
  /// Tells the delegate the interstitial had been animated off the screen.
  public func interstitialDidDismissScreen(_ ad: GADInterstitial) {
    delegate?.viewDidDismissScreen()
  }
  
  /// Tells the delegate that a user click will open another app
  /// (such as the App Store), backgrounding the current app.
  public func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
    delegate?.viewWillLeaveApplication()
  }
  
}
