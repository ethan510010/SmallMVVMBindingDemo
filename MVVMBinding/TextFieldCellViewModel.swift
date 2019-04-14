//
//  TextFieldCellViewModel.swift
//  MVVMBinding
//
//  Created by Ethan Lin on 2019/4/14.
//  Copyright © 2019 Ethan Lin. All rights reserved.
//

import UIKit

// Type Eraser
class Dynamic<T> {

    typealias Listener = (T) -> ()
    var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(self.value)
    }

    init(_ value: T) {
        self.value = value
    }

    private enum CodingKeys: CodingKey {
        case value
    }
}

class TextFieldCellViewModel {

    var text: Dynamic<String>
    var buttonIsChoosen: Dynamic<Bool>

    init(with text: Dynamic<String>, buttonIsChoosen: Dynamic<Bool>) {
        self.text = text
        self.buttonIsChoosen = buttonIsChoosen
    }
}

extension TextFieldCellViewModel {
    var buttonColor: Dynamic<UIColor> {
        let color: UIColor = buttonIsChoosen.value ? UIColor.brown : UIColor.white
        return Dynamic(color)
    }
}
