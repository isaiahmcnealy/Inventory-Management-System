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
            Text("Device Name: " + device.deviceName)
            Text("Status:  \(device.inStock ? "instock" : "checked out")")
            Text("Serial Number: " + device.deviceSerialNumber)
            Text("OS Version: " + device.deviceVersion)
            Text("Modified By: " + device.modifiedBy)
            Text("Last Modified: " + device.lastModified)
            Spacer()
                .frame(height: 10)
            Text("notes: " + device.note.prefix(200))
            
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
