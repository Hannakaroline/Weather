//
//  ContentView.swift
//  Weather
//
//  Created by Hanna on 01/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var cloudThickness = Cloud.Thickness.regular
    @State private var time = 0.0
    
    let backgroundStops: [Gradient.Stop] = [
        .init(color: .sunrisetStart, location: 0)
    ]
    
    let backgroundBottomStops: [Gradient.Stop] = [
        .init(color: .sunrisetEnd, location: 0)
    ]
    
    var body: some View {
        ZStack {
            CloudsView(thickness: cloudThickness)
            
        }
        .preferredColorScheme(.dark)
        .background(.blue)
        .safeAreaInset(edge: .bottom) {
            VStack {
                Text(formattedTime)
                    .padding(.top)
                Picker("Thickness", selection: $cloudThickness) {
                    ForEach(Cloud.Thickness.allCases, id: \.self) { thickness in
                        Text(String(describing: thickness).capitalized)
                    }
                }
                .pickerStyle(.segmented)
                HStack {
                    Text("Time:")
                    Slider(value: $time)
                }
                .padding()
            }
            .padding(5)
            .frame(maxWidth: .infinity)
            .background(.regularMaterial)
        }
    }
    var formattedTime: String {
        let start = Calendar.current.startOfDay(for: Date.now)
        let advanced = start.addingTimeInterval(time  * 24 * 60 * 60)
        return advanced.formatted(date: .omitted, time: .shortened)
    }
}

#Preview {
    ContentView()
}
