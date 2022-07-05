//
//  Device.swift
//  IMS
//
//  Created by Isaiah McNealy on 7/5/22.
//

import Foundation

struct Device: Identifiable {
    var id = UUID().uuidString
    var deviceName: String
    var deviceSerialNumber: String
    var inStock: Bool
    var lastModified: String
    var modifiedBy: String
}


