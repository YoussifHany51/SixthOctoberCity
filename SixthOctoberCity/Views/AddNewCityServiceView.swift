//
//  AddNewCityServiceView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 08/11/2022.
//

import SwiftUI

struct AddNewCityServiceView: View {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes
        = [.foregroundColor:UIColor.init(.red)]
    }
    
    @State var animate:Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    FirstSection
                    
                    RequiredSection
                    .padding()
                    
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                   .frame(height: 1)
                                   .foregroundColor(.red)
                                   .padding()
                    
                    VStack{
                        Text("You can know and track the number of followers for you")
                            .font(.title2)
                            .foregroundColor(.red)
                        Text("After you add your place with us, you will be able to know through us the number of followers you have and the number of users of the application itself")
                            .font(.callout)
                    }
                    .multilineTextAlignment(.center)
                    .padding()
                    
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                   .frame(height: 1)
                                   .foregroundColor(.red)
                                   .padding()
                    
                    VStack{
                        Text("You can communicate with us to increase the number of followers for you")
                            .font(.title2)
                            .foregroundColor(.red)
                        Text("Through a group of experts in the field, you can increase the number of followers for you")
                            .font(.callout)
                    }
                    .multilineTextAlignment(.center)
                    .padding()
                    
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                   .frame(height: 1)
                                   .foregroundColor(.red)
                                   .padding()
                    
                    NavigationLink(destination: ContactUsView()) {
                        Text("Send us your place and contact us")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height:55)
                            .frame(maxWidth:.infinity)
                            .background(animate ? Color.red:Color.black)
                            .cornerRadius(10)
                            .padding(.bottom)
                    }
                    .padding(.horizontal,animate ? 30 : 50)
                    .shadow(
                    color: animate ? Color.red.opacity(0.7) : Color.black.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0, y: animate ? 50 : 30 )
                    .scaleEffect(animate ? 1.1 : 1.0 )
                    .offset(y: animate ? -7 : -0)
                }
                .onAppear(perform: makeAnimation)
                .navigationTitle("Add your place ❤️")
            }
        }
    }
    
    
    func makeAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            withAnimation(
                .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct AddNewCityServiceView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCityServiceView()
    }
}


struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}


extension AddNewCityServiceView{
    private var FirstSection : some View {
        VStack{
            VStack{
                Text("Add your place with us within 24 hours")
                    .font(.title2)
                    .foregroundColor(.red)
                Text("Send us the full details of your place via our email or via WhatsApp")
                    .font(.callout)
            }
            .multilineTextAlignment(.center)
            .padding()
            
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .frame(height: 1)
                .foregroundColor(.red)
                .padding()
        }
    }
    private var RequiredSection:some View{
        VStack{
            Text("Details required to add your place with us")
                .font(.title3)
                .foregroundColor(.red)
            VStack{
                HStack{
                    Text("⦿")
                    Spacer()
                    Text("Place name")
                    Spacer()
                }
                HStack{
                    Text("⦿")
                    Spacer()
                    Text("Place Logo")
                    Spacer()
                }
                HStack{
                    Text("⦿")
                    Spacer()
                    Text("Place phone number")
                    Spacer()
                }
                HStack{
                    Text("⦿")
                    Spacer()
                    Text("Address in detail with share location")
                    Spacer()
                }
                HStack{
                    Text("⦿")
                    Spacer()
                    Text("Work times")
                    Spacer()
                }
                HStack{
                    Text("⦿")
                    Spacer()
                    Text("All social media links")
                    Spacer()
                }
                HStack{
                    Text("⦿")
                    Spacer()
                    Text("Website")
                    Spacer()
                }
            }
            .padding()
        }
    }
}
