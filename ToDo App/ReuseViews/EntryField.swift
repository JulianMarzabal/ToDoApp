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
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title)
                .padding(.top, 20)
                .padding(.leading, 16)
            HStack {
               
                TextField(placeholder, text: $entryText)
//                    .onChange(of: Just(entryText), perform: { newValue in
//                        print(newValue)
//                    })
                    .onReceive(Just(entryText), perform: { newValue in
                        print(newValue)
                        
                    })
                    .padding([.leading,.trailing],20)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    
                if let image = image.eyeImage {
                    Image(systemName: image)
                        //.frame(width: 40, height: 40)
                        
                }
                    
                
            }
            .padding([.top,.bottom], 20)
            
            
        }
        .frame(maxHeight:35)
        .padding([.leading,.trailing], 20)
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
