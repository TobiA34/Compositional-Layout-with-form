//
//  FormDateCollectionViewCell.swift
//  CompostionalLayoutForm
//
//  Created by tobi adegoroye on 16/05/2021.
//

import UIKit

class FormDateCollectionViewCell: UICollectionViewCell {
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    func bind( _ item: FormComponent) {
        
        guard let item = item as? DateFormComponent else { return }
        setup(item:item)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        removeViews()
    }
}

private extension FormDateCollectionViewCell {
    func setup(item: DateFormComponent) {
 
        contentView.addSubview(datePicker)
        
        datePicker.datePickerMode = .date
        
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            datePicker.topAnchor.constraint(equalTo: contentView.topAnchor),
            datePicker.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
