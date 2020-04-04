//
//  CourseStore.swift
//  DesignCode
//
//  Created by Felix Lin on 4/4/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import Contentful

let client = Client(spaceId: "hzshzg9atzet", accessToken: "tYVYtKX9srjQ_lRBPxb6R_5sZlgivzRblDISZafp4nc")

func getArray() {
    let query = Query.where(contentTypeId: "course")
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        print(result)
    }
}
