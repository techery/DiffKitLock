//
//  ViewController.swift
//  DiffKitLock
//
//  Created by Deszip on 25.10.2021.
//

import Foundation
import UIKit
import DifferenceKit

// MARK: - Models -

struct User: Differentiable {
    let id: Int
    let name: String
    var differenceIdentifier: Int { return id }
    func isContentEqual(to source: User) -> Bool {
        return name == source.name
    }
}

class BatchCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
}

// MARK: - VC -

class BatchUpdateViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = buildDataSet()
    }
    
    // MARK: - Actions
    
    @IBAction func update(_ sender: Any) {
        UIView.performWithoutAnimation {
            let changeset = StagedChangeset(source: dataSource, target: buildDataSet())
            collectionView.reload(using: changeset) { data in
                dataSource = data
            }
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BatchCell", for: indexPath)
        if let cell = (cell as? BatchCell) {
            cell.label.text = dataSource[indexPath.item].name
        }
        return cell
    }
    
    // MARK: - Data generation
    
    private func buildDataSet() -> [User] {
        var items: [User] = []
        for i in 0..<Int.random(in: 1..<1000) {
            items.append(User(id: i, name: UUID().uuidString))
        }
        
        return items
    }
}


