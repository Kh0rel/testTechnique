//
//  OffersDetailViewController.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import UIKit

final class OffersDetailViewController: UIViewController {
   
   // MARK: - Public properties -
   
   var presenter: OffersDetailPresenterProtocol?
   
   var closeButton: UIButton = {
      let button = UIButton(frame: .zero)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.contentMode = .redraw
      button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      button.setImage(UIImage(named: "ic_close")?.withRenderingMode(.alwaysTemplate), for: .normal)
      button.tintColor = .white
      button.layer.cornerRadius = 40/2
      button.addRoundedBlurEffect(with: CGSize(width: 40, height: 40), and: .dark)
      return button
   }()
   
   var collectionView: UICollectionView = {
      let collectionViewFlowLayout = UICollectionViewFlowLayout()
      let collectionview = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
      collectionview.translatesAutoresizingMaskIntoConstraints = false
      collectionview.register(DescriptionCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: DescriptionCollectionViewCell.self))
      collectionview.register(HeaderImageCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HeaderImageCollectionViewCell.self))
      collectionview.register(SellerInformationsCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: SellerInformationsCollectionViewCell.self))
      collectionview.register(OfferInformationsCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: OfferInformationsCollectionViewCell.self))
      return collectionview
   }()
   
   // MARK: - Lifecycle -
   
   override func viewDidLoad() {
      super.viewDidLoad()
      self.presenter?.viewDidLoad()
      self.collectionView.dataSource = self
      self.collectionView.delegate = self
      self.collectionView.backgroundColor = .white
      self.closeButton.addTarget(self, action: #selector(self.didCloseButtonPressed), for: .touchUpInside)
      self.view.addSubview(collectionView)
      self.view.addSubview(closeButton)
      
      NSLayoutConstraint.activate([
         self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
         self.collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
         self.collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
         self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
         self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 12),
         self.closeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
         self.closeButton.widthAnchor.constraint(equalToConstant: 40),
         self.closeButton.heightAnchor.constraint(equalTo: self.closeButton.widthAnchor, multiplier: 1.0)
      ])
   }
   
   @objc func didCloseButtonPressed() {
      self.presenter?.didTapClosedButton()
   }
}

// MARK: - Extensions -

extension OffersDetailViewController: OffersDetailViewProtocol {
   func reloadData() {
      self.collectionView.reloadData()
   }
}

extension OffersDetailViewController: UICollectionViewDataSource {
   
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      return self.presenter?.sections.count ?? 0
   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return self.presenter?.sections[section].items.count ?? 0
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let section = self.presenter?.sections[indexPath.section],
            let model = section.items[indexPath.row] as? OfferDetailsItem else {
         return UICollectionViewCell()
      }
      
      return ContentDataBuilder.cell(for: model, in: collectionView, at: indexPath)
   }
}

extension OffersDetailViewController: UICollectionViewDelegateFlowLayout {
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      guard let section = self.presenter?.sections[indexPath.section],
            let model = section.items[indexPath.row] as? OfferDetailsItem else {
         return .zero
      }
      
      return ContentDataBuilder.size(for: model, in: collectionView, at: indexPath)
   }
}
