//
//  String+RandSeed.swift
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 10/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

import Foundation

extension String {
  func randSeed(count: Int = 4) -> [UInt32] {
    var randSeed = [UInt32](repeating: 0, count: count)
    // Optimize: iterate through characters directly instead of using index(offsetBy:)
    // which is O(n) for each access, making the original loop O(n²)
    for (i, char) in self.enumerated() {
      // &* and &- are the "overflow" operators. Need to be used there.
      // There is no overflow left shift operator so we do "&* pow(2, 5)" instead of "<< 5"
      randSeed[i % count] = ((randSeed[i % count] &* (2 << count)) &- randSeed[i % count])
      randSeed[i % count] = randSeed[i % count] &+ char.asciiValue
    }
    return randSeed
  }
}
