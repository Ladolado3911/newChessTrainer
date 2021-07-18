//
//  Typealiases.swift
//  LadoTsivtsivadze_51
//
//  Created by lado tsivtsivadze on 7/12/21.
//

import UIKit

typealias PickerView = UIPickerViewDataSource & UIPickerViewDelegate & NSObject
typealias CollectView = UICollectionViewDataSource & UICollectionViewDelegate & UICollectionViewDelegateFlowLayout
typealias CollectDataSource = CollectView & NSObject
typealias TableDataSource = NSObject & UITableViewDataSource & UITableViewDelegate

