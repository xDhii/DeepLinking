//
//  DeepLinkManager.swift
//  DeepLinking
//
//  Created by ALURA on 04/07/23.
//

import Foundation

class DeepLinkManager {
    func handleDeepLink(url: URL, appData: AppData){
        
        let string = url.absoluteString.replacingOccurrences(of: "alinking://", with: "")
        
        let componentsOnString = string.components(separatedBy: "?")
        
        for component in componentsOnString {
            if component.contains("tab=") {
                let tabRawValues = component.replacingOccurrences(of: "tab=", with: "")
                if let requestedTab = Tab.convert(from: tabRawValues){
                    appData.activeTab = requestedTab
                }
            }
            
            if component.contains("promo=") {
                let promoValues = component.replacingOccurrences(of: "promo=", with: "")
                if (promoValues == "50A"){
                    appData.isShowingPromo = true
                }
            }
        }
        
    }
}
