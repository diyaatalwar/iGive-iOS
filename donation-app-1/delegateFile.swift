//
//  delegateFile.swift
//  donation-app-1
//
//  Created by Diya Talwar on 23/11/23.
//

import Foundation

protocol CustomCellDelegate: AnyObject {
    func didTapButton(with data: Organization)
}

