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
//
//                Spacer()
                
                NavigationLink(destination: CheckoutDeviceView()){
                    Text("Checkout Device")
                }
                .buttonStyle(PrimaryButtonStyle())
               
                NavigationLink(destination: AddDeviceView()){
                    Text("Add Device")
                }
                .buttonStyle(PrimaryButtonStyle())
                
                NavigationLink(destination: RemoveDeviceView()){
                    Text("Remove Device")
                }
                .buttonStyle(PrimaryButtonStyle())

            }
            
//            .buttonStyle(.bordered)
//            .padding()
//            .frame(width: 250, height: 50, alignment: .center)
            
        }
        
        
        
        
    }
    
}

struct PrimaryButtonStyle: ButtonStyle {

    var backgroundColor: Color = .red
    var textColor: Color = Color.white
    var height: CGFloat = 46
    var cornerRadius: CGFloat = 15
    var fontSize: CGFloat = 15
    var disabled: Bool = false
    var textSidePadding: CGFloat = 50
    var weight: Font.Weight = .semibold

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding([.leading, .trailing], textSidePadding)
            .frame(width: 350, height: 50, alignment: .center)
            .background(disabled ? .gray : backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(cornerRadius)
            .font(.system(size: fontSize, weight: weight, design: .default))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
