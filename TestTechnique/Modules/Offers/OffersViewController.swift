//
//  OffersViewController.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 05/03/2021.
//

import UIKit

final class OffersViewController: UIViewController {
   
   // MARK: - Public properties -
   
   var presenter: OffersPresenterProtocol?
   
   public var collectionView: UICollectionView = {
      let collectionViewLayout = UICollectionViewFlowLayout()
      let collectionview = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
      collectionview.translatesAutoresizingMaskIntoConstraints = false
      collectionview.register(LargeContentCollectionViewCell.self, forCellWithReuseIdentifier: LargeContentCollectionViewCell.REUSE_IDENTIFIER)
      return collectionview
   }()
   
   // MARK: - Lifecycle -
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // TODO : Remove it and move to DataBinder class
      self.collectionView.delegate = self
      self.collectionView.dataSource = self
      self.collectionView.backgroundColor = .white
      self.view.addSubview(self.collectionView)
      NSLayoutConstraint.activate([
         self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
         self.collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
         self.collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
         self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
      ])
   }
   
}

// MARK: - Extensions -

extension OffersViewController: OffersViewProtocol {
   
}

extension OffersViewController: UICollectionViewDataSource {
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 4
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargeContentCollectionViewCell.REUSE_IDENTIFIER, for: indexPath)
      cell.backgroundColor = .blue
      return cell
   }
   
}

extension OffersViewController: UICollectionViewDelegate {
   
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      self.presenter?.didSelectItem(at: indexPath)
   }
   
}

extension OffersViewController: UICollectionViewDelegateFlowLayout {
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: self.collectionView.bounds.size.width, height: 120)
   }
   
}

