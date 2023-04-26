//
//  MainController.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 31/3/2023.
//

import UIKit

class MainController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    

    @IBOutlet weak var CollectionImageSwip: UICollectionView!
    
//    var currentCellindex = 0
//    var timer  : Timer?
    
    
    var listeimage = ["affiche3","aaa","affiche3"]
    var timer: Timer?
        var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.hidesBackButton = true
//        navigationItem.leftBarButtonItem = nil
        navigationController?.navigationBar.backIndicatorImage = UIImage()
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
        navigationController?.navigationBar.isHidden = true

        CollectionImageSwip.layer.cornerRadius = 8
        CollectionImageSwip.layer.shadowColor = UIColor.black.cgColor
        CollectionImageSwip.layer.shadowOpacity = 0.5
        CollectionImageSwip.layer.shadowOffset = CGSize(width: 0, height: 2)
        CollectionImageSwip.layer.shadowRadius = 4
        CollectionImageSwip.layer.masksToBounds = false

        CollectionImageSwip.clipsToBounds = true
        
        
        
        
        WebSocketManagerSingleton.shared.connect()
        // Do any additional setup after loading the view.
        
        
        CollectionImageSwip.dataSource = self
        CollectionImageSwip.delegate = self
        
        
        //CollectionImageSwip.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "CellAcc")
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
//        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(SlideToNext), userInfo: nil, repeats: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return listeimage.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = CollectionImageSwip.dequeueReusableCell(withReuseIdentifier: "CellAcc", for: indexPath) as! MainCollectionViewCell
            
            // Set the image for the cell
            cell.Images.image = UIImage(named: listeimage[indexPath.row])
            
            return cell
        }
        
        // MARK: - Collection View Delegate Flow Layout
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: CollectionImageSwip.frame.width, height: CollectionImageSwip.frame.height)
        }
        
        // MARK: - Auto Scrolling
        
    @objc func scrollToNextItem() {
        let nextIndex = (currentIndex + 1) % listeimage.count
        let indexPath = IndexPath(item: nextIndex, section: 0)
        CollectionImageSwip.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        currentIndex = nextIndex
    }
    
//    @objc func SlideToNext(){
//        if currentCellindex < listeimage.count-1  {
//            currentCellindex = currentCellindex+1
//
//        }else{
//            currentCellindex = 0
//        }
//
//        CollectionImageSwip.scrollToItem(at: IndexPath(item: currentCellindex, section: 0), at: .right, animated: true)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension MainController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return listeimage.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = CollectionImageSwip.dequeueReusableCell(withReuseIdentifier: "CellAcc", for: indexPath) as! MainCollectionViewCell
//        cell.Images.image = UIImage(named: listeimage[indexPath.row])
//
//        return cell
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: CollectionImageSwip.frame.width, height: CollectionImageSwip.frame.height)
//    }
//
//
//
//}
