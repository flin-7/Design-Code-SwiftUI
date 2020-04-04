//
//  DataStore.swift
//  DesignCode
//
//  Created by Felix Lin on 4/4/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import Combine

class DataStore: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        Api().getPosts { posts in
            self.posts = posts
        }
    }
}
