//
//  SSMMobileAds+GADBannerViewDelegate.swift
//  AdMobLib
//
//  Created by Susana Santos Moreno on 26/04/2020.
//  Copyright © 2020 Susana Santos Moreno. All rights reserved.
//

import Foundation

import GoogleMobileAds

extension SSMMobileAds: GADBannerViewDelegate {
  
  /// Tells the delegate an ad request loaded an ad.
  public func adViewDidReceiveAd(_ bannerView: GADBannerView) {
    if let viewController = bannerView.rootViewController {
      bannerView.translatesAutoresizingMaskIntoConstraints = false
      
      if #available(iOS 11.0, *) {
        let guide: UILayoutGuide = viewController.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate(
          [bannerView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
           bannerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)]
        )
      }
      else {
        // Center the banner horizontally.
        viewController.view.addConstraint(NSLayoutConstraint(item: bannerView,
                                                             attribute: .centerX,
                                                             relatedBy: .equal,
                                                             toItem: viewController.view,
                                                             attribute: .centerX,
                                                             multiplier: 1,
                                                             constant: 0))
        // Lock the banner to the top of the bottom layout guide.
        viewController.view.addConstraint(NSLayoutConstraint(item: bannerView,
                                                             attribute: .bottom,
                                                             relatedBy: .equal,
                                                             toItem: viewController.view.safeAreaLayoutGuide.bottomAnchor,
                                                             attribute: .top,
                                                             multiplier: 1,
                                                             constant: 0))
      }
    }
    
    DispatchQueue.main.async {
      bannerView.alpha = 0
      UIView.animate(withDuration: 1, animations: {
        bannerView.alpha = 1
      })
    }
  }
  
  /// Tells the delegate an ad request failed.
  public func adView(_ bannerView: GADBannerView,
                     didFailToReceiveAdWithError error: GADRequestError) {
    bannerView.removeFromSuperview()
    delegate?.failToReceiveViewAd()
  }
  
  /// Tells the delegate that the full-screen view has been dismissed.
  public func adViewDidDismissScreen(_ bannerView: GADBannerView) {
    delegate?.viewDidDismissScreen()
  }
  
  /// Tells the delegate that a full-screen view will be presented in response
  /// to the user clicking on an ad.
  public func adViewWillPresentScreen(_ bannerView: GADBannerView) {
    delegate?.viewWillPresentScreen()
  }
  
  /// Tells the delegate that a user click will open another app (such as
  /// the App Store), backgrounding the current app.
  public func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
    delegate?.viewWillLeaveApplication()
  }
  
  /// Tells the delegate that the full-screen view will be dismissed.
  public func adViewWillDismissScreen(_ bannerView: GADBannerView) {
    delegate?.viewWillDismissScreen()
  }
}
