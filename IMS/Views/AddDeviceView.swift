//
//  AddDeviceView.swift
//  IMS
//
//  Created by Isaiah McNealy on 7/4/22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct AddDeviceView: View {
    
    // create reference to Device view model
    @ObservedObject private var viewModel = DevicesViewModel()
    
    @State var deviceName: String = ""
    @State var deviceSerialNumber: String = ""
    
    var body: some View {

        VStack{
            Text("Add Device")
                .font(.title)
            Form {
                TextField(text: $deviceName) {
                    Text("Device Name")
                }
                TextField(text: $deviceSerialNumber) {
                    Text("Device Serial #")
                }
            }
    
            Button("Add Device", action: btnAddDevice)
                .buttonStyle(.borderedProminent)
           
        }
        
    }
    
    func btnAddDevice() {
    
        // check if text fields are empty
        if (deviceName == "" || deviceSerialNumber == ""){
            print("Error: Device name and serial number are required. Please try again")
            return
        } else {
            self.viewModel.writeData(deviceName: deviceName, deviceSerial: deviceSerialNumber)
            // clear fields
            deviceName = ""
            deviceSerialNumber = ""
        }
    }

}

struct AddDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeviceView()
    }
}
