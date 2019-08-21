//
//  BindingTextField.swift
//  GoodWheather
//
//  Created by omrobbie on 21/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField: UITextField {

    var textChangeClosure: (String) -> () = { _ in }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            textChangeClosure(text)
        }
    }

    private func commonInit() {
        addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    func bind(callback: @escaping (String) -> ()) {
        textChangeClosure = callback
    }
}
