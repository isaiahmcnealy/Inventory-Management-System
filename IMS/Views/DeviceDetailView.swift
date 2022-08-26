//
//  DeviceDetailView.swift
//  IMS
//
//  Created by Isaiah McNealy on 8/26/22.
//

import SwiftUI

struct DeviceDetailView: View {
    
    let device: Device
    
    var body: some View {
        VStack{
            Text("Device Name: " + device.deviceName)
            Text("Status:  \(device.inStock ? "instock" : "checked out")")
            Spacer()
                .frame(height: 50)
            Text("Device Serial Number: " + device.deviceSerialNumber)
            Text("Device OS Version: " + device.deviceVersion)
            Text("Modified By: " + device.modifiedBy)
            Text("Last Modified: " + device.lastModified)
            Text("notes: " + device.note)
        }
    }
}

struct DeviceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceDetailView(device: devices[0])
    }
}
