//
//  TapCounterModel.swift
//  MVCWithTapCounter
//
//  Created by 游宗諭 on 2020/7/21.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import Foundation

protocol ModelUpdateReactor {
    func update(_ model: TapCounterModel)
}
class TapCounterModel {
    struct State {
        var count: Int = 0
    }
    private var state = State() {
        didSet {
            toUpdate()
        }
    }
    var updater: ModelUpdateReactor?
    
    func requestUpdate() {
        toUpdate()
    }
    func getValue() -> Int {
        return state.count
    }
    
    func toAddOne(sender: TapCounterController) {
        state.count += 1
    }
    
    private func toUpdate() {
        updater?.update(self)
    }
}
