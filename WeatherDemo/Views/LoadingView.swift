//
//  LoadingView.swift
//  WeatherDemo
//
//  Created by Mohammed Alharbi on 15/07/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    LoadingView()
}
