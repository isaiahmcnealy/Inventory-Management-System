//
//  DeviceDetailView.swift
//  IMS
//
//  Created by Isaiah McNealy on 8/26/22.
//

import SwiftUI

struct DeviceDetailView: View {
    
    @ObservedObject private var viewModel = DevicesViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    let device: Device
    
    var body: some View {
        List{
            Group {
                Text("Type: " + device.deviceType)
                Text("Device Model: " + device.deviceModel)
                Text("Device Manufacturer: " + device.deviceManufacturer)
                Text("Serial Number: " + device.deviceSerialNumber)
                Text("Model Number: " + device.deviceModelNumber)
                Text("Operating System: " + device.deviceOS)
                Text("OS Version: " + device.deviceVersion)
                Text("Availability:  \(device.inStock ? "instock" : "checked out")")
            }
            Text("Device ID: " + device.deviceID)
            Text("Last Modified: " + device.lastModified)
            Text("Modified By: " + device.modifiedBy)
            Text("Notes: " + device.note.prefix(200))
        }
        Button(device.inStock ? "Checkout" : "Return"){
            btn_checkoutDevice(device: device)
        }
        .buttonStyle(PrimaryButtonStyle())
        
    }
    
    func btn_checkoutDevice(device: Device){
                
        let device_is_instock : Bool = device.inStock ? true : false
        
        if(device_is_instock){
            self.viewModel.checkoutDevice(deviceID: device.deviceID)
        } else {
            self.viewModel.returnDevice(deviceID: device.deviceID)
        }
        
        presentationMode.wrappedValue.dismiss()
        
    }
}




struct DeviceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceDetailView(device: devices[0])
    }
}
