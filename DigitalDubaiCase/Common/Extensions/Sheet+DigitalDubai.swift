//
//  Sheet+DigitalDubai.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation
import Sheeeeeeeeet

extension ActionSheet {
    func getSelectedItems() -> [MenuItem] {
        let items = self.items.compactMap { $0 as? SelectItem }
        let selectedItems = items.filter { $0.isSelected }
        return selectedItems
    }
}
