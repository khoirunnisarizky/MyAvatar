//
//  ContentView.swift
//  MyAvatar
//
//  Created by khoirunnisa' rizky noor fatimah on 19/03/23.
//

import SwiftUI

struct ContentView: View {
    
    // TODO: Store our core data with property wrapper to sync the UI later
    @FetchRequest(sortDescriptors: []) var avatars: FetchedResults<AvatarData>
    
    // TODO: Enable access to add and saving Core Data Objects
    @Environment(\.managedObjectContext) var moc
    
    @State var savedAvatars: [Avatar] = []
    @State var headView: Head = .head1
    @State var isHead1: Bool = true
    @State var bodyView: Body = .body1
    @State var isBody1: Bool = true
    @State var bottomView: Bottom = .bottom1
    @State var isBottom1: Bool = true
    
    var body: some View {
        VStack {
//            List(avatars) { avatar in
//                Text(avatar.headValue ?? "Unknown")
//            }
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
                //savedAvatars.append(Avatar(head: headView, body: bodyView, bottom: bottomView))
                let newAvatar = AvatarData(context: moc)
                newAvatar.headValue = headView.rawValue
                newAvatar.bodyValue = bodyView.rawValue
                newAvatar.bottomValue = bottomView.rawValue
                try? moc.save()
            }
            
            GeometryReader { reader in
                ZStack{
                    RoundedRectangle(cornerRadius: 10).frame(width: reader.size.width, height: reader.size.height)
                        
                    HStack {
                        ForEach(avatars) { avatar in
                            VStack {
                                Image(avatar.headValue ?? "")
                                    .resizable()
                                    .scaleEffect(1.5)
                                    .aspectRatio(contentMode: .fit)
                                Image(avatar.bodyValue ?? "")
                                    .resizable()
                                    .scaleEffect(1.6)
                                    .aspectRatio(contentMode: .fit)
                                Image(avatar.bottomValue ?? "")
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
