//
//  WAHoursView.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 18.01.2024.
//

import UIKit
import SnapKit

class WAHoursView: UIView
{
    var hours : [Hour] = []
    var collectionView : UICollectionView!
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        configureCollectionView()
        configure()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollectionView()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(WAHourCVCell.self, forCellWithReuseIdentifier: WAHourCVCell.identifier)
        
    }
    
    func configure()
    {
        
        addSubview(collectionView!)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
    }

}
extension WAHoursView : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return hours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WAHourCVCell.identifier, for: indexPath) as? WAHourCVCell else {
            return UICollectionViewCell()
        }
        cell.set(with: hours[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height/3, height: collectionView.frame.height)
    }
    
    
}
