//
//  ContentView.swift
//  Map
//
//  Created by Bana on 2024/02/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var inputText:String = ""
    @State var dispSearchKey:String = ""
    @State var dispMapType:MKMapType = .standard
    
    var body: some View {
        VStack {
            TextField("キーワードを入力してください",
                      text: $inputText, onCommit: {
                dispSearchKey = inputText
                print("入力したキーワード：" + dispSearchKey)
            })
            .padding()
            
            ZStack(alignment: .bottomTrailing) {
                MapView(searchKey: dispSearchKey, mapType: dispMapType)
                Button(action: {
                    if dispMapType == .standard {
                        dispMapType = .satellite
                    } else if dispMapType == .satellite {
                        dispMapType = .hybrid
                    } else if dispMapType == .hybrid {
                        dispMapType = .satelliteFlyover
                    } else if dispMapType == .hybridFlyover {
                        dispMapType = .mutedStandard
                    } else {
                        dispMapType = .standard
                    }
                }){
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0,
                               height: 35.0,
                               alignment: .leading)
                        .padding(.trailing, 20.0)
                        .padding(.bottom, 30.0)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
