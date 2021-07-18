//
//  CollectionDataSource.swift
//  LadoTsivtsivadze_51
//
//  Created by lado tsivtsivadze on 7/13/21.
//

import UIKit

struct Cell {
    var nibName: String!
    var identifier: String!
    
    init(nibName nib: String, identifier id: String) {
        nibName = nib
        identifier = id
    }
}

protocol CollectionDataSource: CollectDataSource {
    
    associatedtype DataArray
    associatedtype RootController
    associatedtype Element
    
    var collectionView: UICollectionView! { get set }
    var cellsArr: [Cell]! { get set }
    
    init(collectionView collectView: UICollectionView,
         cellsArray arr: [Cell],
         rootController controller: RootController,
         dataArray data: DataArray,
         dataElement element: Element)
    
    init(collectionView collectView: UICollectionView,
         cellsArray arr: [Cell],
         rootController controller: RootController,
         count data: Int)
    
    func configCollection()
    func configCells()
}

extension CollectionDataSource {
   
    func configCollection() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func configCells() {
        cellsArr.forEach { cell in
            let nib = UINib(nibName: cell.nibName, bundle: nil)
            self.collectionView.register(nib, forCellWithReuseIdentifier: cell.identifier)
        }
    }
}


class GenericCollectDataSource<T, E, F>: NSObject, CollectionDataSource {
    
    typealias DataArray = T
    typealias RootController = E
    typealias Element = F
    
    var collectionView: UICollectionView!
    var cellsArr: [Cell]!
    var rootController: RootController!
    var data: DataArray?
    var element: Element!
    var count: Int?
    
    var counter: Int {
        if let data = self.data as? Array<Element> {
            return data.count
        }
        else {
            return count!
        }
    }

    required init(collectionView collectView: UICollectionView,
         cellsArray arr: [Cell],
         rootController controller: RootController,
         dataArray data: DataArray,
         dataElement element: Element) {
        
        super.init()
        self.collectionView = collectView
        self.cellsArr = arr
        self.rootController = controller
        self.data = data
        self.element = element
        self.configCollection()
        self.configCells()
        self.collectionView.reloadData()
    }
    
    required init(collectionView collectView: UICollectionView,
         cellsArray arr: [Cell],
         rootController controller: RootController,
         count counter: Int) {
        
        super.init()
        self.collectionView = collectView
        self.cellsArr = arr
        self.rootController = controller
        self.count = counter
        self.configCollection()
        self.configCells()
        self.collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return counter
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 20, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

