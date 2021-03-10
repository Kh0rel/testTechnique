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
   
   var closeButton: UIButton = {
      let button = UIButton(frame: .zero)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.contentMode = .scaleAspectFill
      /// - TODO: refactor image
      button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      button.setImage(UIImage(named: "ic_close")?.withRenderingMode(.alwaysTemplate), for: .normal)
      button.tintColor = .white
      button.layer.cornerRadius = 40/2
      button.addRoundedBlurEffect(with: CGSize(width: 40, height: 40), and: .dark)
      return button
   }()
   
   public var collectionView: UICollectionView = {
      let collectionViewLayout = UICollectionViewFlowLayout()
      let collectionview = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
      collectionview.translatesAutoresizingMaskIntoConstraints = false
      
      collectionview.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: HeaderCollectionReusableView.self))
      collectionview.register(LargeContentCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: LargeContentCollectionViewCell.self))
      collectionview.register(TagsListCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: TagsListCollectionViewCell.self))
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
         self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
         self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
         self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
         self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
      ])
      
      self.presenter?.viewDidLoad()
   }
   
   @objc func didCloseButtonPressed() {
      self.presenter?.didTapClosedButton()
   }
}

// MARK: - Extensions -

extension OffersViewController: OffersViewProtocol {
   
   func displayCloseButton() {
      self.closeButton.addTarget(self, action: #selector(didCloseButtonPressed), for: .touchUpInside)
      self.view.addSubview(self.closeButton)
      NSLayoutConstraint.activate([
         self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 12),
         self.closeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
         self.closeButton.widthAnchor.constraint(equalToConstant: 40),
         self.closeButton.heightAnchor.constraint(equalTo: self.closeButton.widthAnchor, multiplier: 1.0)
      ])
   }
   
   func reloadData() {
      self.collectionView.reloadData()
   }
   
}

extension OffersViewController: UICollectionViewDataSource {
   
   func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: HeaderCollectionReusableView.self), for: indexPath)
      
      if let header = headerView as? HeaderCollectionReusableView,
         let headerText = self.presenter?.sections[indexPath.section].header {
         header.update(text: headerText)
      }
      
      return headerView
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
      
      return CGSize(width: collectionView.bounds.size.width, height: 40)
   }
   
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      return self.presenter?.sections.count ?? 0
   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return self.presenter?.sections[section].items.count ?? 0
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let section = self.presenter?.sections[indexPath.section],
            let model = section.items[indexPath.row] as? OfferListItem else {
         return UICollectionViewCell()
      }
      
      let cell = ContentDataBuilder.cell(for: model, in: collectionView, at: indexPath)
      
      if let cell = cell as? TagsListCollectionViewCell {
         cell.delegate = self
      }
      
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
      guard let section = self.presenter?.sections[indexPath.section],
            let model = section.items[indexPath.row] as? OfferListItem else {
         return .zero
      }
      
      return ContentDataBuilder.size(for: model, in: collectionView, at: indexPath)
   }
}

extension OffersViewController: TagsListCollectionViewCellDelegate {
   
   func didSelect(category: Category) {
      self.presenter?.didSelect(category: category)
   }
}

