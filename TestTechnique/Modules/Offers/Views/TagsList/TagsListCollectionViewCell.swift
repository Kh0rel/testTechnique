//
//  TagsListCollectionViewCell.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 08/03/2021.
//

import UIKit

protocol TagsListCollectionViewCellDelegate: class {
   func didSelect(category: Category)
}

class TagsListCollectionViewCell: UICollectionViewCell {
   
   private var categories: [Category] = []
   
   weak var delegate: TagsListCollectionViewCellDelegate?
   
   private var collectionView: UICollectionView = {
      let collectionViewLayout = UICollectionViewFlowLayout()
      collectionViewLayout.scrollDirection = .horizontal
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
      collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: TagCollectionViewCell.self))
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      collectionView.showsHorizontalScrollIndicator = false
      return collectionView
   }()
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.collectionView.dataSource = self
      self.collectionView.delegate = self
      self.collectionView.backgroundColor = .white
      self.addSubview(self.collectionView)
      
      NSLayoutConstraint.activate([
         self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2),
         self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
         self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
      ])
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
   }
}

extension TagsListCollectionViewCell: UICollectionViewDataSource {
    
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return self.categories.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TagCollectionViewCell.self), for: indexPath) as? TagCollectionViewCell else {
         return UICollectionViewCell()
      }
      cell.layer.cornerRadius = 10
      cell.backgroundColor = indexPath.row % 2 == 0 ? .orange : .brown
      cell.titleLabel.text = self.categories[indexPath.row].name
      return cell
   }
}

extension TagsListCollectionViewCell: UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: collectionView.bounds.width / 2.5, height: collectionView.bounds.height - 20)
   }
}

extension TagsListCollectionViewCell: UICollectionViewDelegate {
   
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      self.delegate?.didSelect(category: self.categories[indexPath.row])
   }
   
}

extension TagsListCollectionViewCell: CellUpdatable {
   func update(content: FormattedModelProtocol) {
      guard let content = content as? OfferListItem,
            case OfferListItem.categories(let categories) = content else { return }
      
      self.categories = categories
      self.collectionView.reloadData()
   }
}

extension TagsListCollectionViewCell: CellSizable {
   static func size(with content: FormattedModelProtocol, fitting size: CGSize, at indexPath: IndexPath) -> CGSize {
      guard let content = content as? OfferListItem,
            case OfferListItem.categories(let categories) = content,
            categories.isEmpty == false else { return .zero }
      
      return CGSize(width: size.width, height: 80)
   }
}
