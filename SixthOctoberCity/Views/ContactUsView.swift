//
//  ContactUsView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 08/11/2022.
//

import SwiftUI

struct ContactUsView: View {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes
        = [.foregroundColor:UIColor.init(.red)]
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    
                }
                .navigationTitle("Contact Us")
            }
        }        
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
