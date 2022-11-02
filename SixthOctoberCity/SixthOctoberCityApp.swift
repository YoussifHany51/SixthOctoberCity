//
//  SixthOctoberCityApp.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 31/10/2022.
//

import SwiftUI

@main
struct SixthOctoberCityApp: App {
    
    @StateObject var vm : CityServiceViewModel = CityServiceViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
        }
    }
}
