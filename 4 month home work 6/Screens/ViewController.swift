//
//  ViewController.swift
//  4 month home work 6
//
//  Created by Nurtilek on 1/30/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource  {
    
    var Images: [Image] = []
    
    private lazy var myBackimage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "backward")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var myUpperText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Recipe Categories"
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 19, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var myUpperBT: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("star", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.backgroundColor = .white
        bt.addTarget(self, action: #selector(secondTapped), for: .touchUpInside)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    private lazy var mySearchImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Search")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        ImageData()
        bottomOfScreen()
        let rightBarItem = UIBarButtonItem(customView: myUpperBT)
        self.navigationItem.rightBarButtonItem = rightBarItem
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        upperPartScreen()
    }
    
    private func upperPartScreen() {
        
        view.addSubview(myBackimage)
        NSLayoutConstraint.activate([
            myBackimage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            myBackimage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myBackimage.heightAnchor.constraint(equalToConstant: 20),
            myBackimage.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(myUpperText)
        NSLayoutConstraint.activate([
            myUpperText.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            myUpperText.leadingAnchor.constraint(equalTo: myBackimage.leadingAnchor, constant: 40)
        ])
        
        view.addSubview(mySearchImg)
        NSLayoutConstraint.activate([
            mySearchImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            mySearchImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            mySearchImg.heightAnchor.constraint(equalToConstant: 20),
            mySearchImg.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(myUpperBT)
        NSLayoutConstraint.activate([
            myUpperBT.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            myUpperBT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            myUpperBT.heightAnchor.constraint(equalToConstant: 20),
            myUpperBT.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func bottomOfScreen() {
        view.addSubview(myCollectionView)
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: myUpperText.topAnchor, constant: 40),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        myCollectionView.dataSource = self
    }
    
    private func ImageData() {
        Images = [
            Image(image: "salad"),
            Image(image: "burger"),
            Image(image: "pizza"),
            Image(image: "noodles"),
            Image(image: "beef"),
            Image(image: "chicken"),
            Image(image: "sushi"),
            Image(image: "rice"),
            Image(image: "seafood"),
            Image(image: "decerte"),
            Image(image: "saurma"),
            Image(image: "soup"),
            Image(image: "shashlik"),
            Image(image: "food"),
            Image(image: "jng"),
            Image(image: "content"),
            Image(image: "krab"),
            Image(image: "foosfod"),
            Image(image: "boorsok"),
            Image(image: "ganfan"),
        ]
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.row < Images.count else {
            return UICollectionViewCell()
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.configure(with: Images[indexPath.row])
        return cell
    }

    @objc func secondTapped(_ sender: UIButton) {
        print(123)
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

