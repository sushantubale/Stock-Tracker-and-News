//
//  SearchBar.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/17/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField(placeholder, text: $text)
                .foregroundColor(.primary)

                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
        }
        .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
        .foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10.0)

    }
}

#Preview {
    SearchBar(text: .constant("Search"), placeholder: "Placeholder")
}
