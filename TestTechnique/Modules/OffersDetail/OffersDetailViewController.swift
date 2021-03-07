//
//  OffersDetailViewController.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import UIKit

final class OffersDetailViewController: UIViewController {
   
   // MARK: - Public properties -
   
   var presenter: OffersDetailPresenterProtocol!
   
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
   
   var collectionView: UICollectionView = {
      let collectionViewFlowLayout = UICollectionViewFlowLayout()
      let collectionview = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
      collectionview.translatesAutoresizingMaskIntoConstraints = false
      collectionview.register(DescriptionCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: DescriptionCollectionViewCell.self))
      collectionview.register(HeaderImageCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HeaderImageCollectionViewCell.self))
      collectionview.register(SellerInformationsCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: SellerInformationsCollectionViewCell.self))
      return collectionview
   }()
   
   // MARK: - Lifecycle -
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
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
      self.presenter.didTapClosedButton()
   }
   
}

// MARK: - Extensions -

extension OffersDetailViewController: OffersDetailViewProtocol {
}

extension OffersDetailViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 6
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      var cellType: UICollectionViewCell.Type
      switch indexPath.row {
      case 0:
         cellType = HeaderImageCollectionViewCell.self
      case 2:
         cellType = SellerInformationsCollectionViewCell.self
      default:
         cellType = DescriptionCollectionViewCell.self
      }
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath)
      return cell
   }
   
}

extension OffersDetailViewController: UICollectionViewDelegateFlowLayout {
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      var cellType: UICollectionViewCell.Type
      switch indexPath.row {
      case 0:
         cellType = HeaderImageCollectionViewCell.self
      case 2:
         cellType = SellerInformationsCollectionViewCell.self
      default:
         cellType = DescriptionCollectionViewCell.self
      }
      
      if let contentSizable = cellType as? ContentSizable.Type {
         if indexPath.row == 2 {
            return contentSizable.size(with: "SIRET: 401059", fitting: collectionView.bounds.size, at: indexPath)
         }
         return contentSizable.size(with: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
                                                        fitting: collectionView.bounds.size,
                                                        at: indexPath)
      }
      return CGSize(width: collectionView.bounds.size.width, height: 0)
   }
   
}
