//
//  ButtonView.swift
//  ToDo App
//
//  Created by Julian Marzabal on 06/08/2023.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        
        VStack {
            Button {
                action()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(background)
                    
                    Text(title)
                        .foregroundColor(Color.white)
                        .bold()
                    
                }
            }
            .padding()
        }
       // .frame(width: 200, height: 70, alignment: .center)
        .frame(maxHeight: 80)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Log in",
                   background: .brown) {
            // Action
        }
    }
}
