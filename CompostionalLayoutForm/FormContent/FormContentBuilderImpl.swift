//
//  FormContentBuilderImpl.swift
//  CompostionalLayoutForm
//
//  Created by tobi adegoroye on 16/05/2021.
//

import Foundation

final class FormContentBuilderImpl {
    
    var content: [FormSectionComponent] {
        return [
            
            FormSectionComponent(items: [
                
                TextFormComponent(placeholder: "First Name"),
                TextFormComponent(placeholder: "Last Name"),
                TextFormComponent(placeholder: "Email", keyboardType: .emailAddress),
                TextFormComponent(placeholder: "Job"),
                DateFormComponent(mode: .date),
                ButtonFormComponent(title: "Confirm")
            ])
            
        ]
    }
}
