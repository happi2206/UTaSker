//
//  UploadPhotosView.swift
//  UTaSker
//
//  Created by Happiness on 2/6/2025.
//
import SwiftUI
import PhotosUI

struct UploadPhotosView: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var images: [UIImage] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Add photos (optional)")
                .font(.subheadline)
                .fontWeight(.medium)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    
                 
                    PhotosPicker(
                        selection: $selectedItems,
                        maxSelectionCount: 5,
                        matching: .images
                    ) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemGray6))
                                .frame(width: 100, height: 100)
                            
                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                    }

       
                    ForEach(images.indices, id: \.self) { index in
                        ZStack(alignment: .topTrailing) {
                            Image(uiImage: images[index])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .clipped()

                    
                            Button(action: {
                                images.remove(at: index)
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                                    .background(Color.black.opacity(0.6))
                                    .clipShape(Circle())
                            }
                            .offset(x: 6, y: -6)
                        }
                    }
                }.padding(.vertical)
            }

            Spacer()
        }
        .padding()
        .onChange(of: selectedItems) {
            Task {
                for item in selectedItems {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        images.append(uiImage)
                    }
                }
                selectedItems.removeAll()
            }
        }

    }
}
