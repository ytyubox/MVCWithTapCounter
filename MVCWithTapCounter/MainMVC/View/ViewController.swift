//
//  ViewController.swift
//  MVCWithTapCounter
//
//  Created by 游宗諭 on 2020/7/21.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit
enum Global  {
    static let controller = TapCounterController(updateReactor: nil)
}

class ViewController: UIViewController,ModelUpdateReactor {
    
    var controller: TapCounterController!
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        controller.requestToUpdate()
    }
    
// MARK: - Setup
    private func setup() {
        // controller default object
         controller =
            controller ?? TapCounterController(updateReactor: self)
        button.setTitle("tap me", for: .normal)
        button.addTarget(
            controller,
            action: #selector(TapCounterController.toAddSelector),
            for: .touchUpInside)
        
    }
    // MARK: - Model did update
    func update(_ model: TapCounterModel) {
        updateLabel(value: model.getValue())
    }
    private func updateLabel(value: Int) {
        label.text = "\(value)"
    }
}
