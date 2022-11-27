//
//  Device.swift
//  IMS
//
//  Created by Isaiah McNealy on 7/5/22.
//

import Foundation

struct Device: Identifiable {
    var id = UUID().uuidString
    var deviceID: String
    var deviceName: String
    var deviceSerialNumber: String
    var deviceVersion: String
    var inStock: Bool
    var lastModified: String
    var modifiedBy: String
    var note: String
}

let devices = [
    Device(deviceID: "1", deviceName: "test_android_000", deviceSerialNumber: "000-12345", deviceVersion: "", inStock: true, lastModified: "", modifiedBy: "Isaiah McNealy", note: ""),
Device(deviceID: "2", deviceName: "test_iPad_000", deviceSerialNumber: "000-23456", deviceVersion: "", inStock: true, lastModified: "", modifiedBy: "Isaiah McNealy", note: ""),
Device(deviceID: "3", deviceName: "test_iPhone_000", deviceSerialNumber: "000-34567", deviceVersion: "", inStock: true, lastModified: "", modifiedBy: "Isaiah McNealy", note: ""),
Device(deviceID: "4", deviceName: "test_raspberryPi_000", deviceSerialNumber: "000-45678", deviceVersion: "", inStock: true, lastModified: "", modifiedBy: "Isaiah McNealy", note: ""),
]

