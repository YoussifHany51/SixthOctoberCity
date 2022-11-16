//
//  InfoSheetView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 11/11/2022.
//

import SwiftUI

struct InfoSheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var q1:Bool = false
    @State var q2:Bool = false
    @State var q3:Bool = false
    
    var ans1:String = "⦿ By sending all your data and your place will be added within 24 hours."
    var ans2:String = "⦿ Through a group of experts in the field of technology, we can create your app in the fastest time."
    var ans3:String = "⦿ Through a group of experts in the field of marketing, your business will be monitored and your sales and profits will be increased in a well-thought-out line and at the lowest costs."
    
    
    var body: some View {
        VStack{
            Spacer()
            Text("Frequently Asked Questions.")
                .foregroundColor(.red)
                .font(.headline)
                .padding()
            
            VStack(alignment:.leading,spacing: 10){
                Button{
                    withAnimation(.easeInOut(duration: 1)){
                        q1 = true
                        q2 = false
                        q3 = false
                    }
                }
                label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 50)
                        .foregroundColor(.red)
                    
                    HStack{
                        Text("How can you easily add your place with us?")
                    }
                    .foregroundColor(.white)
                    .font(.callout)
                }
            }
                Button{
                    withAnimation(.easeInOut(duration: 1)){
                        q1 = false
                        q2 = true
                        q3 = false
                    }
                }
                label:  {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 50)
                        .foregroundColor(.red)
                    HStack{
                        Text("  How can you make an app in the easiest way and at the best prices?")
                    }
                    .foregroundColor(.white)
                    .font(.callout)
                }
            }
                Button{
                    withAnimation(.easeInOut(duration: 1)){
                        q1 = false
                        q2 = false
                        q3 = true
                    }
                }
                label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 50)
                        .foregroundColor(.red)
                    HStack{
                        Text("How can you provide your followers and increase your sales with us through Google?")
                            .padding()
                        
                    }
                    .foregroundColor(.white)
                    .font(.callout)
                }
            }
                if q1 {
                    Text(ans1)
                }else if q2{
                    Text(ans2)
                }else if q3{
                    Text(ans3)
                }else{
                    Text("")
                }
            }
            Spacer()
        }
        .padding()
        .overlay(BackButton , alignment: .topLeading)
    }
}


struct InfoSheetView_Previews: PreviewProvider {
    static var previews: some View {
        InfoSheetView()
    }
}



extension InfoSheetView{
    private var BackButton: some View{
        Button{
            presentationMode.wrappedValue.dismiss()
        } label:{
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.ultraThickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}
