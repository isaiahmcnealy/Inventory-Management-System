//
//  DeviceDetailView.swift
//  IMS
//
//  Created by Isaiah McNealy on 8/26/22.
//

import SwiftUI

struct DeviceDetailView: View {
    
    // create reference to Device view model
    @ObservedObject private var viewModel = DevicesViewModel()
    
    let device: Device
    
    var body: some View {
        List{
            Text("Device Name: " + device.deviceName)
            Text("Status:  \(device.inStock ? "instock" : "checked out")")
            Text("Device Serial Number: " + device.deviceSerialNumber)
            Text("Device OS Version: " + device.deviceVersion)
            Text("Modified By: " + device.modifiedBy)
            Text("Last Modified: " + device.lastModified)
            Text("notes: " + device.note)
        }
        
        Button(action: changeDeviceStatus){
            Text("\(device.inStock ? "Checkout" : "Return")")
        }
        .buttonBorderShape(.capsule)
        .foregroundColor(Color.red)
        
    }
    
    func changeDeviceStatus(){
        
    }
}


struct DeviceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceDetailView(device: devices[0])
    }
}
