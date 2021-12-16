//
//  RatingView.swift
//  Project_11
//
//  Created by Hasan Abuzayed on 11/22/21.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack(spacing: 4) {
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1) { number in
                image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Rating"))
        .accessibilityValue(Text("\(rating) star\(rating > 1 ? "s" : "")"))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                if rating < maximumRating { rating += 1 }
            case .decrement:
                if rating > 1 { rating -= 1 }
            default:
                break
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct Ratingview_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
