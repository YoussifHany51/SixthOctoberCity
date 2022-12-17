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
    
    @EnvironmentObject var vm:CityServiceViewModel
    @State var infoSheet:Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Info
                    Divider()
                    UserInfoSection_Message
                }
                .sheet(isPresented: $infoSheet, content: {
                    InfoSheetView()
                })
                .onTapGesture {
                    dismissKeyBoard()
                }
                .navigationTitle("Get in touch 💬")
            }
        }        
    }
    func textChecker()->Bool{
        if(vm.userName.count<3||vm.userEmail.count<6||vm.userNumber.count<10||vm.userMessage.count<3){
            return false
        }
        return true
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
            .environmentObject(CityServiceViewModel())
    }
}


extension ContactUsView{
    private var Info:some View{
        VStack{
            HStack {
                Text("Contact Us via email or phone")
                     .padding(.leading)
                     .foregroundColor(.gray)
                Button{
                    infoSheet.toggle()
                }label: {
                    Image(systemName: "info.circle")
                }
            }
            .padding()
                .foregroundColor(.red.opacity(0.8))
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50,height: 50)
                        .foregroundColor(.gray.opacity(0.3))
                    Image(systemName: "location")
                        .foregroundColor(.red)
                }
                VStack(spacing: 5){
                    Text("6-October City")
                }
                Spacer()
            }
            .padding(.horizontal)
                HStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50,height: 50)
                            .foregroundColor(.gray.opacity(0.3))
                        Image(systemName: "phone.fill")
                            .foregroundColor(.red)
                    }
                    VStack(spacing: 5){
                        Text("+20 1125588334")
                    }
                    Spacer()
                }
                .padding(.horizontal)
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50,height: 50)
                        .foregroundColor(.gray.opacity(0.3))
                    Image(systemName: "envelope")
                        .foregroundColor(.red)
                }
                VStack(spacing: 5){
                    Text(verbatim:"info@6-OctoberCity.com")
                        .foregroundColor(.primary)
                }
                Spacer()
            }
            .padding(.horizontal)
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50,height: 50)
                        .foregroundColor(.gray.opacity(0.3))
                    Image(systemName: "clock")
                        .foregroundColor(.red)
                }
                VStack(spacing: 5){
                    Text("8:00 AM ~ 11:00 PM")
                }
                Spacer()
            }
            .padding(.horizontal)
        }
    }
    private var UserInfoSection_Message : some View{
        VStack{
            Text("Technical Support")
                .foregroundColor(.red)
            Text("We will get back to you within 24 hours")
                .foregroundColor(.gray)
            
            HStack(spacing: 8) {
                Image(systemName: "person")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                TextField("Name",text:$vm.userName )
                    .font(.system(size: 20,weight: .semibold))
                    .foregroundColor(.primary)
                Divider()
            }
            .padding()
            HStack(spacing: 8) {
                Image(systemName: "envelope")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                TextField("E-mail",text:$vm.userEmail)
                    .font(.system(size: 20,weight: .semibold))
                    .foregroundColor(.primary)
                    .keyboardType(.emailAddress)
                Divider()
            }
            .padding()
            HStack(spacing: 8) {
                Image(systemName: "phone.fill")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                TextField("Phone",text:$vm.userNumber)
                    .font(.system(size: 20,weight: .semibold))
                    .foregroundColor(.primary)
                    .keyboardType(.decimalPad)
                Divider()
            }
            .padding()
            TextField("Leave message here", text: $vm.userMessage,axis: .vertical)
            .lineLimit(1...6)
            .font(.system(size: 20,weight: .semibold))
            .foregroundColor(.primary)
            .padding()
            
            Button{
                
                vm.resetTextFields()
            }label: {
                Text("SEND")
                    .foregroundColor(textChecker() ? Color.white : Color.red)
                    .font(.headline)
                    .frame(height:55)
                    .frame(maxWidth:.infinity)
                    .background(Color.gray.opacity(0.3))
                    .background(textChecker() ? Color.red : Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .disabled(!textChecker())
            .padding()
        }
    }
}
