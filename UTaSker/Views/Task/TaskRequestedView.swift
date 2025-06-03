import SwiftUI

struct TaskRequestedView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack {
                
                HStack {
                    Spacer()
                    Text("Task Requested")
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding(.top, 8)
                        .padding(.horizontal, 80)
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding(.trailing, 8)
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)

                Spacer()

                
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.green)
                    .padding(.bottom, 20)

                
                Text("You've made a request!")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 8)

               
                Text("Please wait for the poster to review your profile and contact you for the next steps.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)

                Spacer()

                
                PrimaryButton(
                    title: "View Your Task",
                    action: {
                        print("View your Task tapped")
                    },
                    backgroundColor: .primaryDark,
                    textColor: .white,
                    cornerRadius: 10
                )
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    TaskRequestedView()
}

