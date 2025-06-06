import SwiftUI

struct TaskStatusText {
    static func getColor(for status: TaskOpenStatus) -> Color {
        switch status {
        case .open:
            return Color.primaryGreen
        case .pending:
            return Color.orange
        case .ongoing:
            return Color.primaryBlue
        case .awaitingReview:
            return Color.red
        case .completed:
            return Color.gray
        case .cancelled:
            return Color.gray
        }
    }
}

struct StatusText: View {
    var isMyTask: Bool
    var status: TaskOpenStatus
    var numberOfOffers: Int?
        var body: some View {
            let formattedStatus = status.rawValue.replacingOccurrences(of: "([a-z])([A-Z])", with: "$1 $2", options: .regularExpression).capitalized
            HStack{
                Text(formattedStatus)
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
    StatusText(isMyTask: true, status: .awaitingReview, numberOfOffers: 3)
}
