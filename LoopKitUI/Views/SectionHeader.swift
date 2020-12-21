//
//  SectionHeader.swift
//  LoopKitUI
//
//  Created by Nathaniel Hamming on 2020-02-20.
//  Copyright © 2020 LoopKit Authors. All rights reserved.
//

import SwiftUI

public struct SectionHeader: View {
    var label: String
    var style: Style
    
    public enum Style {
        case regular
        case tight
    }
    
    public init(label: String, style: Style = .default) {
        self.label = label
        self.style = style
    }
    
    public var body: some View {
        if #available(iOS 14.0, *) {
            // iOS 14 puts section headers in all-caps by default.  This un-does that.
            content.textCase(nil)
        } else {
            content
        }
    }
    
    @ViewBuilder private var content: some View {
        Text(label)
            .font(.headline)
            .foregroundColor(.primary)
            .padding(.leading, style == .tight ? -10 : 0)
    }
}

public extension SectionHeader.Style {
    
    static let `default`: SectionHeader.Style  = {
        if #available(iOSApplicationExtension 14.0, *) {
            return .regular
        } else {
            return .tight
        }
    }()
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader(label: "Header Label")
    }
}
