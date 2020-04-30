//
//  SSMMobileAds+GADRewardedVideoDelegate.swift
//  AdMobLib
//
//  Created by Susana Santos Moreno on 27/04/2020.
//  Copyright © 2020 Susana Santos Moreno. All rights reserved.
//

import Foundation
import GoogleMobileAds

extension SSMMobileAds: GADRewardedAdDelegate {
  
  ///Tells the delegate that the user earned a reward.
  public func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
    delegate?.userDidEarnReward(reward)
  }
  
  /// Tells the delegate that the rewarded ad failed to present.
  public func rewardedAd(_ rewardedAd: GADRewardedAd, didFailToPresentWithError error: Error) {
    delegate?.failToReceiveViewAd()
  }
  
  /// Tells the delegate that the rewarded ad was presented.
  public func rewardedAdDidPresent(_ rewardedAd: GADRewardedAd) {
    delegate?.viewDidPresent()
  }
  
  /// Tells the delegate that the rewarded ad was dismissed.
  public func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
    delegate?.viewDidDismissScreen()
  }
}
