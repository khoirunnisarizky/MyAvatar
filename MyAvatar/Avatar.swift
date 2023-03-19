//
//  Avatar.swift
//  MyAvatar
//
//  Created by khoirunnisa' rizky noor fatimah on 19/03/23.
//

import Foundation

struct Avatar: Hashable {
    var head: Head
    var body: Body
    var bottom: Bottom
    
    init(head: Head, body: Body, bottom: Bottom) {
        self.head = head
        self.body = body
        self.bottom = bottom
    }
}

enum Head: String {
    case head1 = "Head-1"
    case head2 = "Head-2"
}

enum Body: String {
    case body1 = "Body-1"
    case body2 = "Body-2"
}

enum Bottom: String {
    case bottom1 = "Bottom-1"
    case bottom2 = "Bottom-2"
}
