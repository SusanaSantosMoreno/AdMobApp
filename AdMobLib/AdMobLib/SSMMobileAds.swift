//
//  SSMMobileAds.swift
//  AdMobLib
//
//  Created by Susana Santos Moreno on 23/04/2020.
//  Copyright © 2020 Susana Santos Moreno. All rights reserved.
//

import Foundation

import GoogleMobileAds

public class SSMMobileAds: NSObject {
  
  public static let shared = SSMMobileAds()
  
  public weak var delegate: SSMMobileAdsProtocol?

  weak var interstitialViewController: UIViewController?
  var interstitialAd: GADInterstitial?

  // banner size options
  public let CommonBannerSize: CGSize = kGADAdSizeBanner.size
  public let BigBannerSize = kGADAdSizeLargeBanner.size
  public let MediumBannerSize = kGADAdSizeMediumRectangle.size
  public let FullBannerSize = kGADAdSizeFullBanner.size

  private override init() { }
  
  /// Configure the framework's public class to use it
  /// - Parameter interstitialID: ID of intertitial ad
  public func configure(interstitialID: String?) {
    GADMobileAds.sharedInstance().start(completionHandler: nil)
    #if DEBUG
    GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ kGADSimulatorID as? String  ?? ""]
    #endif
    
    if let inID = interstitialID {
      prepareInterstitialAd(with: inID)
    }
  }
  
  /// Create and load a banner Ad
  /// - Parameter adID: The banner ID
  /// - Parameter viewController: The view controller where the banner will be displayed
  /// - Parameter size : The banner size
  public func showBanner(with adID: String, in viewController: UIViewController, with size: CGSize) {
    
    let bannerView = GADBannerView(adSize: GADAdSize(size: size, flags: 0))
    
    bannerView.delegate = self
    
    bannerView.adUnitID = adID
    bannerView.rootViewController = viewController
    viewController.view.addSubview(bannerView)
    
    bannerView.load(GADRequest())
  }
  
  /// Prepare the interstitial ad
  /// - Parameter adID : The interstitial ID
  public func prepareInterstitialAd(with adID: String) {
    interstitialAd = GADInterstitial(adUnitID: adID)
    
    guard let interstitial = interstitialAd else {
      return
    }

    interstitial.delegate = self
    let request = GADRequest()
    interstitial.load(request)
  }
  
  /// Create and load an intersticial Ad
  /// - Parameter viewController:The view controller where the interstitial will be displayed
  public func showIntersticial(in viewController: UIViewController) {
    guard let interstitial = interstitialAd else {
      return
    }
    
    if interstitial.isReady {
      interstitial.present(fromRootViewController: viewController)
    }
  }
  
  /// Create and load a rewarded Ad
  /// - Parameter adID : the rewarded ID
  /// - Parameter viewController:The view controller where the rewarded will be displayed
  public func showRewarded(with adID: String, in viewController: UIViewController) {
    let rewarded = GADRewardedAd(adUnitID: adID)
    rewarded.load(GADRequest(), completionHandler: { error in
      if error != nil {
        self.delegate?.failToLoadRewarded()
      }
    })
    
    //create a thread to check if the rewarded is ready
    DispatchQueue.global(qos: .default).async {
      while !rewarded.isReady {
        Thread.sleep(forTimeInterval: 0.2)
      }
      rewarded.present(fromRootViewController: viewController, delegate: self)
    }
  }
}
