//
//  PostList.swift
//  DesignCode
//
//  Created by Felix Lin on 4/4/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import SwiftUI

struct PostList: View {
    @State private var posts = [Post]()
    
    var body: some View {
        List(posts) { post in
            Text(post.title)
            
        }
        .onAppear {
            Api().getPosts { posts in
                self.posts = posts
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
