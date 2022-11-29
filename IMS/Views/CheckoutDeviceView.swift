//
//  CheckoutDeviceView.swift
//  IMS
//
//  Created by Isaiah McNealy on 7/4/22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct CheckoutDeviceView: View {
    
    @ObservedObject private var viewModel = DevicesViewModel()
    
//    @State var showingDetailView = false
    
    var body: some View {
       
        List(viewModel.devices) { device in
            NavigationLink(destination: DeviceDetailView(device: device)) {
                DeviceRow(device: device)
            }
        }
        .onAppear(){
            self.viewModel.fetchData()
        }
        
    }
}



struct DeviceRow: View {
    var device: Device
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(device.deviceName)
                Text(device.deviceVersion).font(.footnote)
                Text(device.deviceSerialNumber).font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
            Text(device.inStock ? "instock" : "checked out")
        }
    }
}


struct CheckoutDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutDeviceView()
    }
}
