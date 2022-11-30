//
//  Device.swift
//  IMS
//
//  Created by Isaiah McNealy on 7/5/22.
//

import Foundation

struct Device: Identifiable {
    var id = UUID().uuidString
    var deviceUID:String            // firebase device unique identifier
    var deviceID: String            // device identifier (model name + serial number)
    var deviceModel: String         // device model
    var deviceManufacturer: String  // device manufacturer
    var deviceOS: String            // device os
    var deviceSerialNumber: String  // device serial number
    var deviceModelNumber: String   // device model number
    var deviceVersion: String       // device os version
    var inStock: Bool               // device status
    var lastModified: String        // date last modified
    var modifiedBy: String          // person modified by
    var note: String
    var deviceType: String          // type of device
}

let devices = [
    Device(
        deviceUID: "",
        deviceID: "1",
        deviceModel: "test_android_000",
        deviceManufacturer: "Samsung",
        deviceOS: "android",
        deviceSerialNumber: "000-12345",
        deviceModelNumber: "MDLNUM123",
        deviceVersion: "",
        inStock: true,
        lastModified: "",
        modifiedBy: "Isaiah McNealy",
        note: "",
        deviceType: "phone"
    ),
    Device(
        deviceUID: "",
        deviceID: "1",
        deviceModel: "test_iPhone_000",
        deviceManufacturer: "Samsung",
        deviceOS: "android",
        deviceSerialNumber: "000-12345",
        deviceModelNumber: "MDLNUM123",
        deviceVersion: "",
        inStock: true,
        lastModified: "",
        modifiedBy: "Isaiah McNealy",
        note: "",
        deviceType: "phone"
    ),
    Device(
        deviceUID: "",
        deviceID: "1",
        deviceModel: "test_raspberryPi_000",
        deviceManufacturer: "Samsung",
        deviceOS: "android",
        deviceSerialNumber: "000-12345",
        deviceModelNumber: "MDLNUM123",
        deviceVersion: "",
        inStock: true,
        lastModified: "",
        modifiedBy: "Isaiah McNealy",
        note: "",
        deviceType: "phone"
    ),
]

