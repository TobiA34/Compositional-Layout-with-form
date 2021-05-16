//
//  ViewController.swift
//  CompostionalLayoutForm
//
//  Created by tobi adegoroye on 16/05/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var formContentBuilder = FormContentBuilderImpl()
    private lazy var formCompLayout = FormCompositionalLayout()
    private lazy var dataSource = makeDataSource()
    
    private lazy var collectionVw: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: formCompLayout.layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(FormButtonCollectionViewCell.self, forCellWithReuseIdentifier: FormButtonCollectionViewCell.cellId)
        cv.register(FormTextCollectionViewCell.self, forCellWithReuseIdentifier: FormTextCollectionViewCell.cellId)
        cv.register(FormDateCollectionViewCell.self, forCellWithReuseIdentifier: FormDateCollectionViewCell.cellId)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateDataSource()
    }
}

private extension ViewController {
    func setupView() {
        
        
        
        view.backgroundColor = .white
        
        collectionVw.dataSource = dataSource
        
        view.addSubview(collectionVw)
        NSLayoutConstraint.activate([
            collectionVw.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionVw.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionVw.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionVw.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    func makeDataSource() -> UICollectionViewDiffableDataSource<FormSectionComponent, FormComponent> {
        return UICollectionViewDiffableDataSource(collectionView: collectionVw) { collectionVw, indexPath, item in
            
            switch item {
            case is TextFormComponent:
                let cell = collectionVw.dequeueReusableCell(withReuseIdentifier: FormTextCollectionViewCell.cellId, for: indexPath) as! FormTextCollectionViewCell
                cell.bind(item)
                return cell
            case is DateFormComponent:
                let cell = collectionVw.dequeueReusableCell(withReuseIdentifier: FormDateCollectionViewCell.cellId, for: indexPath) as! FormDateCollectionViewCell
                cell.bind(item)
                return cell
            case is ButtonFormComponent:
                let cell = collectionVw.dequeueReusableCell(withReuseIdentifier: FormButtonCollectionViewCell.cellId, for: indexPath) as! FormButtonCollectionViewCell
                cell.bind(item)
                return cell
            default:
                let cell = collectionVw.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.cellId, for: indexPath)
                return cell
            }
        }
    }
    
    
    func updateDataSource(animated: Bool = false) {
        DispatchQueue.main.async { [weak self] in
            
            guard let self = self else { return }
            
            var snapshot = NSDiffableDataSourceSnapshot<FormSectionComponent, FormComponent>()
            
            let formSections = self.formContentBuilder.content
            snapshot.appendSections(formSections)
            formSections.forEach{ snapshot.appendItems($0.items, toSection: $0) }
            
            self.dataSource.apply(snapshot, animatingDifferences: animated)
            
        }
    }
    
    
}


