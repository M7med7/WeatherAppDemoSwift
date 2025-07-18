//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Mohammed Alharbi on 15/07/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                } else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.GetCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch{
                                print("error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.671, saturation: 1.0, brightness: 0.464))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
