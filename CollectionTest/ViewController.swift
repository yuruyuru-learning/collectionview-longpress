//
//  ViewController.swift
//  CollectionTest
//
//  Created by Yuki Kuwashima on 2023/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var items: [String] = ["test","test","test","test","test","test","test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(onLongPress))
        self.view.addGestureRecognizer(longPressGesture)
    }
    
    @objc func onLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .ended {
            let position = gesture.location(in: collectionView)
            if let indexPath = collectionView.indexPathForItem(at: position) {
                items.remove(at: indexPath.item)
                collectionView.deleteItems(at: [indexPath])
                collectionView.reloadData()
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}
