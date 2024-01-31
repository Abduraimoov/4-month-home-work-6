//
//  SecondViewController.swift
//  4 month home work 6
//
//  Created by Nurtilek on 1/31/24.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource {
    
    var Images: [Image] = []
    
    private lazy var myUpperText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Salad"
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 19, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var mySearchImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Search")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let myCollectionView2: UICollectionView = {
        let cln = UICollectionViewFlowLayout()
        cln.itemSize = CGSize(width: 340, height: 150)
        cln.minimumLineSpacing = 10
        cln.minimumInteritemSpacing = 10
        cln.scrollDirection = .horizontal
        cln.sectionInset = UIEdgeInsets(top: 10, left: 12, bottom: 0, right: 0)
        
        let sls = UICollectionView(frame: .zero, collectionViewLayout: cln)
        sls.translatesAutoresizingMaskIntoConstraints = false
        sls.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return sls
    }()
    
    private lazy var myBottomText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Sort by"
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 19, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var myTrailnText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Most Popular"
        lbl.textColor = .systemRed
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let myCollectionView: UICollectionView = {
        let cln = UICollectionViewFlowLayout()
        cln.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 20, height: 100)
        cln.minimumLineSpacing = 10
        cln.minimumInteritemSpacing = 10
        cln.scrollDirection = .vertical
        cln.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        
        let sls = UICollectionView(frame: .zero, collectionViewLayout: cln)
        sls.translatesAutoresizingMaskIntoConstraints = false
        sls.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return sls
    }()
    
    private lazy var myllImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "image2")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        ImageData()
    }
    private func setupUI() {
        
        upperPartScreen()
    }
    private func upperPartScreen() {
        view.backgroundColor = .white
        
        view.addSubview(myUpperText)
        NSLayoutConstraint.activate([
            myUpperText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -32),
            myUpperText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80)
        ])
        
        view.addSubview(mySearchImg)
        NSLayoutConstraint.activate([
            mySearchImg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -30),
            mySearchImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            mySearchImg.heightAnchor.constraint(equalToConstant: 20),
            mySearchImg.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(myCollectionView2)
        NSLayoutConstraint.activate([
            myCollectionView2.topAnchor.constraint(equalTo: myUpperText.bottomAnchor, constant: 30),
            myCollectionView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myCollectionView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            myCollectionView2.heightAnchor.constraint(equalToConstant: 160)
        ])
        myCollectionView2.dataSource = self
        
        view.addSubview(myBottomText)
        NSLayoutConstraint.activate([
            myBottomText.topAnchor.constraint(equalTo: myCollectionView2.bottomAnchor, constant: 15),
            myBottomText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        view.addSubview(myTrailnText)
        NSLayoutConstraint.activate([
            myTrailnText.topAnchor.constraint(equalTo: myCollectionView2.bottomAnchor, constant: 15),
            myTrailnText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        view.addSubview(myCollectionView)
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: myBottomText.topAnchor, constant: 30),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        myCollectionView.dataSource = self
        
        view.addSubview(myllImg)
        NSLayoutConstraint.activate([
            myllImg.topAnchor.constraint(equalTo: myCollectionView2.bottomAnchor, constant: 15),
            myllImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            myllImg.heightAnchor.constraint(equalToConstant: 20),
            myllImg.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func ImageData() {
        Images = [
            Image(image: "nopitok1"),
            Image(image: "nopitok2"),
            Image(image: "cofe"),
            Image(image: "cola"),
            Image(image: "up"),
            Image(image: "kompot"),
            Image(image: "coc"),
            Image(image: "vin"),
            Image(image: "ll1"),
            Image(image: "coctale"),
            Image(image: "ll3"),
            Image(image: "ll2"),
            Image(image: "sok4"),
            Image(image: "ll4"),
            Image(image: "cf3"),
            Image(image: "sok3"),
            Image(image: "cf1"),
            Image(image: "sok2"),
            Image(image: "cf2"),
            Image(image: "sok1"),
        ]
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == myCollectionView2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
            cell.configure(with: Images[indexPath.row])
            return cell
        } else {
            guard indexPath.row < Images.count else {
                return UICollectionViewCell()
            }
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
            cell.configure(with: Images[indexPath.row])
            return cell
        }
    }

}
