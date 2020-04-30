//
//  ViewController.swift
//  AdMobApp
//
//  Created by Susana Santos Moreno on 28/04/2020.
//  Copyright © 2020 Susana Santos Moreno. All rights reserved.
//

import UIKit
import AdMobLib


class ViewController: UIViewController {
    
  override func viewDidLoad() {
    super.viewDidLoad()
    SSMMobileAds.shared.delegate = self
  }
  
  ///Show interstitial Add
  @IBAction func InterstitialPushed(_ sender: Any) {
    SSMMobileAds.shared.showIntersticial(in: self)
  }

  ///Show banner Add
  @IBAction func showBanner(_ sender: Any) {
    SSMMobileAds.shared.showBanner(with: "ca-app-pub-3940256099942544/2934735716", in: self, with: SSMMobileAds.shared.BigBannerSize)
  }
  
  ///Show rewarded Add
  @IBAction func showRewarded(_ sender: Any) {
    SSMMobileAds.shared.showRewarded(with: "ca-app-pub-3940256099942544/1712485313", in: self)
  }
}

