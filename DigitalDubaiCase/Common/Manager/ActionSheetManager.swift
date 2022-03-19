//
//  ActionSheetManager.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation
import UIKit
import Sheeeeeeeeet

final class ActionSheetManager {
    
    static func makeActionSheetPeriodAndSection(_ viewController: UIViewController, selectedPeriod: PopularArticlePeriod, selectedSection: PopularArticleSection, action: @escaping ActionSheet.SelectAction) {
        let items = makePeriodAndSectionMenuItem(selectedPeriod: selectedPeriod, selectedSection: selectedSection)
        let menu = Menu(title: "Select Period and Section", items: items)
        let sheet = ActionSheet(menu: menu, action: action)
        sheet.present(in: viewController, from: nil)
    }
    
    private static func makePeriodAndSectionMenuItem(selectedPeriod: PopularArticlePeriod, selectedSection: PopularArticleSection) -> [MenuItem] {
        var items: [MenuItem] = []
        items.append(SectionTitle(title: "Period"))
        
        PopularArticlePeriod.allCases.forEach {
            items.append(SingleSelectItem(title: $0.value, subtitle: nil, isSelected: selectedPeriod == $0, group: "Period", value: $0, tapBehavior: .none))
        }
        
        items.append(SectionMargin())
        
        items.append(SectionTitle(title: "Section"))
        
        PopularArticleSection.allCases.forEach {
            items.append(SingleSelectItem(title: $0.value, subtitle: nil, isSelected: selectedSection == $0, group: "Section", value: $0, tapBehavior: .none))
        }
        
        items.append(OkButton(title: "OK"))
        return items
    }
}
