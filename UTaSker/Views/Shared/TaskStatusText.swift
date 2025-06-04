import SwiftUI

struct TaskStatusText {
    static func getColor(for status: String) -> Color {
        switch status.lowercased() {
        case "open":
            return Color.primaryGreen
        case "pending":
            return Color.orange
        case "ongoing":
            return Color.primaryBlue
        case "awaiting review":
            return Color.red
        case "completed":
            return Color.gray
        case "cancelled":
            return Color.gray
        default:
            return Color.gray
        }
    }
}

struct StatusText: View {
    var isMyTask: Bool
    var status: String
    var numberOfOffers: Int?
        var body: some View {
            HStack{
                Text(status)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(TaskStatusText.getColor(for: status))
                if(isMyTask){
                    Text("·")
                    Text("\(numberOfOffers ?? 0) offers")
                        .foregroundColor(.textColor2)
                        .font(.subheadline)
                }
            }
        
    }
}

#Preview {
    StatusText(isMyTask: true, status: "Awaiting Review", numberOfOffers: 3)
}
