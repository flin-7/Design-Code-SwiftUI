//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Felix Lin on 3/21/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
