//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by Mohammed Alharbi on 15/07/2025.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack {
                VStack(alignment: .leading, spacing: 5 ){
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                Spacer()
                VStack{
                    HStack{
                        VStack(spacing: 20,){
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                                
                        }
                        .frame(width: 150 , alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.671, saturation: 1.0, brightness: 0.464))
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
