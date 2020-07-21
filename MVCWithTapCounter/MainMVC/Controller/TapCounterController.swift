//
//  TapCounterController.swift
//  MVCWithTapCounter
//
//  Created by 游宗諭 on 2020/7/21.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import Foundation

class TapCounterController {
    init(updateReactor: ModelUpdateReactor?) {
        self.updateReactor = updateReactor
        model.updater = updateReactor
    }
    
    var model = TapCounterModel()
    var updateReactor: ModelUpdateReactor?
    
    @objc func toAddSelector() {
        toAdd()
    }
    func toAdd() {
        model.toAddOne(sender: self)
    }
    func requestToUpdate() {
        model.requestUpdate()
    }
}
