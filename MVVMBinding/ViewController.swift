//
//  ViewController.swift
//  MVVMBinding
//
//  Created by Ethan Lin on 2019/4/14.
//  Copyright © 2019 Ethan Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFiledTableView: UITableView!

    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ViewModel()

        textFiledTableView.delegate = self
        textFiledTableView.dataSource = self
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.textFieldCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let cellViewModel = viewModel.textFieldCellViewModels[indexPath.row]
        textFieldCell.updateContent(cellViewModel: cellViewModel, textHandler: { (text) in
            cellViewModel.text.value = text
        }) {
            cellViewModel.buttonIsChoosen.value = !cellViewModel.buttonIsChoosen.value
        }
        return textFieldCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}
