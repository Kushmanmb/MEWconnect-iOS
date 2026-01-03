//
//  HexNSDecimalNumber.swift
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 04/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

import Foundation
import BigInt

@objc
extension NSString {
  func hexStringToDecimalString() -> NSString? {
    let str = (self as String).stripHexPrefix()
    
    guard let bigUInt = BigUInt(str, radix: 16) else { return nil }
    let decimalString = String(bigUInt, radix: 10)
    return decimalString as NSString
  }
}
