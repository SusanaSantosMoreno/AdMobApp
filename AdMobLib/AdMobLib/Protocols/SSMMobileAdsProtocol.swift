//
//  SSMMobileAdsProtocol.swift
//  AdMobLib
//
//  Created by Susana Santos Moreno on 23/04/2020.
//  Copyright © 2020 Susana Santos Moreno. All rights reserved.
//

import Foundation
import GoogleMobileAds

public protocol SSMMobileAdsProtocol: AnyObject {
  
  func failToLoadRewarded()
  
  func adViewDidReceiveAd()
  func failToReceiveViewAd()
  
  func viewWillPresentScreen()
  func viewWillDismissScreen()
  func viewDidDismissScreen()
  func viewWillLeaveApplication()
  func viewDidPresent()
  func userDidEarnReward(_ reward: GADAdReward)
  
}

// create a default implementation to make these functions optionals
extension SSMMobileAdsProtocol {
  
  func failToLoadRewarded() {}
  
  func failToReceiveViewAd() {}
  
  func viewWillPresentScreen() {}
  
  func viewWillDismissScreen() {}
  
  func viewDidDismissScreen() {}
  
  func viewWillLeaveApplication() {}
  
  func viewDidPresent() {}
}
