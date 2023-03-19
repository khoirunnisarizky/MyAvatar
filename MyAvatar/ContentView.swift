//
//  ContentView.swift
//  MyAvatar
//
//  Created by khoirunnisa' rizky noor fatimah on 19/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var savedAvatars: [Avatar] = []
    @State var headView: Head = .head1
    @State var isHead1: Bool = true
    @State var bodyView: Body = .body1
    @State var isBody1: Bool = true
    @State var bottomView: Bottom = .bottom1
    @State var isBottom1: Bool = true
    
    var body: some View {
        VStack {
            Spacer()
            Image(headView.rawValue)
                .resizable()
                .scaleEffect(1.4)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    isHead1.toggle()
                    headView = isHead1 ? .head1 : .head2
                }
            Image(bodyView.rawValue)
                .resizable()
                .scaleEffect(1.35)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    isBody1.toggle()
                    bodyView = isBody1 ? .body1 : .body2
                }
            Image(bottomView.rawValue)
                .resizable()
                .scaleEffect(1.55)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    isBottom1.toggle()
                    bottomView = isBottom1 ? .bottom1 : .bottom2
                }
            
            
            Button("Save") {
                print("Saved")
                savedAvatars.append(Avatar(head: headView, body: bodyView, bottom: bottomView))
            }
            
            GeometryReader { reader in
                ZStack{
                    RoundedRectangle(cornerRadius: 10).frame(width: reader.size.width, height: reader.size.height)
                        
                    HStack {
                        ForEach(savedAvatars, id: \.self) { avatar in
                            VStack {
                                Image(avatar.head.rawValue)
                                    .resizable()
                                    .scaleEffect(1.5)
                                    .aspectRatio(contentMode: .fit)
                                Image(avatar.body.rawValue)
                                    .resizable()
                                    .scaleEffect(1.6)
                                    .aspectRatio(contentMode: .fit)
                                Image(avatar.bottom.rawValue)
                                    .resizable()
                                    .scaleEffect(1.7)
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        .padding()
                        Spacer()
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
