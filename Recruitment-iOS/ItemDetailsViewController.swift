//
//  DetailsViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController, NetworkingManagerDelegate {
    weak var tableViewController: ItemsListTableViewController?
    let selectedItem: ItemModel
    let selectedIndex: Int

    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.text = CommonStrings.loading
        return textView
    }()

    init(selectedItem: ItemModel, index: Int) {
        self.selectedIndex = index
        self.selectedItem = selectedItem
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
        NetworkingManager.sharedManager.downloadItemWithID(String(selectedIndex))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          NetworkingManager.sharedManager.delegate = self
    }

    func downloadedItems(_ items: [ItemModel]) {
        
    }
    
    func downloadedItemDetails(_ itemDetails: ItemDetailsModel) {
        textView.text = itemDetails.desc
    }

    func setupLayout() {
        view.addSubview(textView)
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
