import UIKit

class ItemDetailViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    var statusBarHidden = true
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.setCollectionViewLayout(createLayout(), animated: false)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: -topbarHeight, left: 0, bottom: 0, right: 0)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          statusBarHidden ? .lightContent : .default
      }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          let atTop = scrollView.contentOffset.y <= 8
          if statusBarHidden != atTop {
              statusBarHidden = atTop
              navigationController?.navigationBar.tintColor = atTop ? .systemRed : .systemRed
              setNeedsStatusBarAppearanceUpdate()
          }
          if atTop { scrollView.contentOffset.y = 0 }
      }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func createLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout{(sectionIndex, environment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                //Image
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(410), heightDimension: .absolute(285))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            case 1:
                //Description
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(170))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return section
            default:
                //Checkout
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(1.0), heightDimension: .absolute(65))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return section
            }
        }
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? 3 : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath)
        case 1:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "descriptionCell", for: indexPath)
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "buyButtonCell", for: indexPath)
        }
    }
}
