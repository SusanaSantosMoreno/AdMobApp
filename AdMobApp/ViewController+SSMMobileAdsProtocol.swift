//
//  ViewController+SSMMobileAdsProtocol.swift
//  AdMobApp
//
//  Created by Susana Santos Moreno on 29/04/2020.
//  Copyright © 2020 Susana Santos Moreno. All rights reserved.
//

import Foundation
import AdMobLib

extension ViewController: SSMMobileAdsProtocol{
  
  /// Print a message if the rewarded load fails
  func failToLoadRewarded() {
    NSLog("Fail to load rewarded view")
  }
  
  /// Print a message before view receives ad
  func adViewDidReceiveAd() {
    NSLog("The ad view did receive ad")
  }
  
  /// Print a message if the ad view cannot be received
  func failToReceiveViewAd() {
    NSLog("Fail to receive the ad view")
  }
  
  /// Print a message after the view is presented on the screen
  func viewWillPresentScreen() {
    NSLog("The view will present screen")
  }
  
  /// Print a  message after the view is dismissed on the screen
  func viewWillDismissScreen() {
    NSLog("The view will dismiss screen")
  }
  
  /// Print a  message before the view is dismissed on the screen
  func viewDidDismissScreen() {
    NSLog("The view did dismiss screeen")
  }
  
  /// Print a  message after the view leaves the application
  func viewWillLeaveApplication() {
    NSLog("The view will leave the application")
  }
  
  /// Print a message before the view presents
  func viewDidPresent() {
    NSLog("The view did Present")
  }
  
  /// Print a message when the user earns a reward
  /// - Parameter reward:  the reward that user earns
  func userDidEarnReward(_ reward: GADAdReward) {
    NSLog("User did earn reward \(reward)")
  }
  
}
