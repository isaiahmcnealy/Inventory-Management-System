//
//  ContentView.swift
//  IMS
//
//  Created by Isaiah McNealy on 7/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {

            VStack{
                
                Text("Digital Health")
                    .font(.title)
                Text("Inventory Management")
                    .font(.headline)
                
                Spacer()
                
                NavigationLink(destination: CheckoutDeviceView()){
                    Text("Checkout Device")
                }
                
                NavigationLink(destination: AddDeviceView()){
                    Text("Add Device")
                }
                
                NavigationLink(destination: RemoveDeviceView()){
                    Text("Remove Device")
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .frame(width: 250, height: 50, alignment: .center)
        }
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
