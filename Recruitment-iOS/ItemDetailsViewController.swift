//
//  DetailsViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    let selectedItem: ItemModel
    let itemsProvider: DownloadItemsProtocol

    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.text = CommonStrings.loading
        return textView
    }()

    init(selectedItem: ItemModel, itemsProvider: DownloadItemsProtocol) {
        self.selectedItem = selectedItem
        self.itemsProvider = itemsProvider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        let title = selectedItem.name
        self.title = TitleEditor.modifyTitle(title: title)
        self.view.backgroundColor = selectedItem.color
        askForItems()
    }

    func askForItems() {
        itemsProvider.downloadItemWithID(selectedItem.id, completion: { result in
            switch result {
            case .success(let item):
                self.textView.text = item.desc
            case .error:
                AlertController.showAlert(on: self, message: CommonStrings.downloadError)
            }
        })
    }

    func setupLayout() {
        view.addSubview(textView)
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
