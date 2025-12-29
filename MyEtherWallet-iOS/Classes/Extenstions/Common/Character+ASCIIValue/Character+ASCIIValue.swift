//
//  Character+ASCIIValue.swift
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 10/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

import Foundation

extension Character {
  
  /**
   * Returns the value of the first 8 bits of this unicode character.
   * This is a correct ascii representation of this character if it is
   * an ascii character.
   * Optimized: access unicodeScalars directly without creating intermediate String
   */
  var asciiValue: UInt32 {
    get {
      // Every Character has at least one unicode scalar, so this is safe
      return self.unicodeScalars.first!.value
    }
  }
}
