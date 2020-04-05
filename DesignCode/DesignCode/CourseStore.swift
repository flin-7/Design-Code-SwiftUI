//
//  CourseStore.swift
//  DesignCode
//
//  Created by Felix Lin on 4/4/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "hzshzg9atzet", accessToken: "tYVYtKX9srjQ_lRBPxb6R_5sZlgivzRblDISZafp4nc")

func getArray(id: String, completion: @escaping([Entry]) -> ()) {
    let query = Query.where(contentTypeId: id)
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .error(let error):
            print(error)
        }
    }
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData
    
    init() {
        getArray(id: "course") { items in
            items.forEach { item in
                self.courses.append(Course(
                    title: item.fields["title"] as! String,
                    subtitle: item.fields["subtitle"] as! String,
                    image: #imageLiteral(resourceName: "Card1"),
                    logo: #imageLiteral(resourceName: "Logo1"),
                    color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),
                    show: false))
            }
        }
    }
}
