//
//  UIFont+CDMarkdownKit.swift
//  CDMarkdownKit
//
//  Created by Christopher de Haan on 11/7/16.
//
//  Copyright © 2016-2018 Christopher de Haan <contact@christopherdehaan.me>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
#elseif os(macOS)
    import Cocoa
#endif

#if os(macOS)

internal extension CDFont {

    private func withTraits(_ trait: Int) -> CDFont {
        let descriptor = fontDescriptor.withSymbolicTraits(CDFontDescriptorSymbolicTraits(UInt32(trait)))
        return CDFont(descriptor: descriptor,
                      size: 0)!
    }

    func bold() -> CDFont {
        return withTraits(NSFontBoldTrait)
    }

    func italic() -> CDFont {
        return withTraits(NSFontItalicTrait)
    }
}

#if swift(>=4.0)

internal extension CDFontDescriptorSymbolicTraits {
    init(_ rawValue: UInt32) {
        self.init(rawValue: rawValue)
    }
}

#endif

#else

internal extension CDFont {

    private func withTraits(_ traits: CDFontDescriptorSymbolicTraits...) -> CDFont {
        let descriptor = fontDescriptor.withSymbolicTraits(CDFontDescriptorSymbolicTraits(traits))
        return CDFont(descriptor: descriptor!,
                      size: 0)
    }

    func bold() -> CDFont {
        return withTraits(.traitBold)
    }

    func italic() -> CDFont {
        return withTraits(.traitItalic)
    }
}

#endif