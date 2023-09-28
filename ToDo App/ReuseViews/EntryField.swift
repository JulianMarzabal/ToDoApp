//
//  EntryField.swift
//  ToDo App
//
//  Created by Julian Marzabal on 10/08/2023.
//

import SwiftUI
import Combine

enum Images {
    case null
    case openEye
    case closeEye
    
    var eyeImage:String? {
        switch self {
        case .null:
            return nil
        case .openEye:
            return "eye"
        case .closeEye:
            return "eye.slash"
        }
    }
}

struct EntryField: View {
    
    @Binding  var entryText:String
    @State var placeholder:String
    @State var title:String
    @State var image:Images = .null
    @State var isSecureField: Bool = false
    @ViewBuilder  var textInput: some View {
        if isSecureField {
            SecureField(placeholder, text: $entryText)
        }else {
            TextField(placeholder, text: $entryText)
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title)
                .padding(.top, 30)
                .padding(.leading, 16)
            HStack {
                
                textInput
                    
                    .onReceive(Just(entryText), perform: { newValue in
                        print(newValue)
                        
                    })
                    .padding([.leading,.trailing],20)
                    .padding(.top, -20)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                
                   
//                } else {
//                    TextField(placeholder, text: $entryText)
//
//                        .onReceive(Just(entryText), perform: { newValue in
//                            print(newValue)
//
//
//                        })
//
//                        .padding([.leading,.trailing],20)
//                        .padding(.top, -20)
//                        .textInputAutocapitalization(.never)
//                        .disableAutocorrection(true)
//
//
//
//
//                }
                
                if let image = image.eyeImage {
                    Image(systemName: image).onTapGesture {
                        isSecureField.toggle()
                        self.image = isSecureField ? .closeEye : .openEye
                    }
                    .padding(.top, -15)
                    
                }
                
            }
            .padding([.top,.bottom], 20)
            
            
        }
        .frame(maxHeight:35)
        .padding([.leading,.trailing], 25)
        .padding([.top,.bottom], 20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray))
        
        
        
        
    }
}


fileprivate struct EntryFieldWrapper: View {
    
    @State var text:String = ""
    
    
    
    var body: some View {
        
        VStack {
            EntryField(entryText: $text, placeholder: "email", title: "Surname")
            EntryField(entryText: $text, placeholder: "password", title: "Password", image: .closeEye)
        }
       
        
            
    }
    
    
    
}





struct EntryField_Previews: PreviewProvider {
  
    
    static var previews: some View {
        EntryFieldWrapper()
    
    }
}
