//
//  HeaderView.swift
//  ToDoList
//
//  Created by Md Gulfam on 28/02/24.
//

import SwiftUI

struct HeaderView: View {
    let title : String
    let subTitle: String
    let angle:Double
    let background : Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                    .bold()
            }
            .padding(.top,80)
            
        }.frame(width: UIScreen.main.bounds.width*3,
                height: 350)
        .offset(y:-150)
    }
}

struct HeaderView_Previews:PreviewProvider {
    static var previews: some View{
        HeaderView(title: "Title",
                   subTitle: "SubTitle",
                   angle: 15,
                   background: .blue)
    }
}

