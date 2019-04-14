//
//  CustomCell.swift
//  MVVMBinding
//
//  Created by Ethan Lin on 2019/4/14.
//  Copyright © 2019 Ethan Lin. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var selectButton: UIButton!

    private var cellViewModel: TextFieldCellViewModel!

    private var textHandler: (String) -> Void = { _ in }

    private var buttonTapHandler: () -> Void = {  }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.selectionStyle = .none

        self.selectButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.inputTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @objc private func buttonTapped() {
        self.buttonTapHandler()
    }

    @objc private func textFieldDidChange() {
        if let inputText = inputTextField.text {
            self.textHandler(inputText)
        }
    }

    func updateContent(cellViewModel: TextFieldCellViewModel, textHandler: @escaping (String) -> Void, buttonTappedHandler: @escaping () -> Void) {
        self.textHandler = textHandler
        self.buttonTapHandler = buttonTappedHandler
        cellViewModel.text.bind { (inputText) in
            self.inputTextField.text = inputText
        }
        cellViewModel.buttonIsChoosen.bind { (isTapped) in
            self.selectButton.backgroundColor = isTapped ? UIColor.white : UIColor.yellow
        }
    }
}
