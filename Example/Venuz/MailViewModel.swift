import Foundation

struct MailViewData {
    let sender: String
    let subject: String
    let content: String
    let relativeTime: String
}

struct Mail {
    let sender: String
    let subject: String
    let content: String
    let date: Date
}

struct MailViewModel {
    let mails = [
        Mail(
            sender: "Ava Taylor",
            subject: "Re: Meeting Agenda",
            content: """
            Here's the agenda for our meeting next week. I've included all the topics we need to cover, as well as time allocations for each.

            If you have any additional items to discuss or any specific points to address, please let me know, and we can integrate them into the agenda.

            It's essential that our meeting is productive and addresses all relevant matters.

            Looking forward to our meeting! Ava
            """,
            date: Calendar.current.date(byAdding: .day, value: 18, to: Date())!
        ),
        Mail(
            sender: "William Smith",
            subject: "Meeting Tomorrow",
            content: """
            Hi, let's have a meeting tomorrow to discuss the project. I've been reviewing the project details and have some ideas I'd like to share. It's crucial that we align on our next steps to ensure the project's success.

            Please come prepared with any questions or insights you may have. Looking forward to our meeting!

            Best regards, William
            """,
            date: Calendar.current.date(byAdding: .month, value: -1, to: Date())!
        ),
        Mail(
            sender: "William Smith",
            subject: "Meeting Tomorrow",
            content: """
            Hi, let's have a meeting tomorrow to discuss the project. I've been reviewing the project details and have some ideas I'd like to share. It's crucial that we align on our next steps to ensure the project's success.

            Please come prepared with any questions or insights you may have. Looking forward to our meeting!

            Best regards, William
            """,
            date: Calendar.current.date(byAdding: .month, value: -3, to: Date())!
        ),
        Mail(
            sender: "Alice Smith",
            subject: "Re: Project Update",
            content: """
            Thank you for the project update. It looks great! I've gone through the report, and the progress is impressive. The team has done a fantastic job, and I appreciate the hard work everyone has put in.

            I have a few minor suggestions that I'll include in the attached document.

            Let's discuss these during our next meeting. Keep up the excellent work!

            Best regards, Alice
            """,
            date: Calendar.current.date(byAdding: .month, value: -5, to: Date())!
        ),
        Mail(
            sender: "Emily Davis",
            subject: "Re: Question about Budget",
            content: """
            I have a question about the budget for the upcoming project. It seems like there's a discrepancy in the allocation of resources.

            I've reviewed the budget report and identified a few areas where we might be able to optimize our spending without compromising the project's quality.

            I've attached a detailed analysis for your reference. Let's discuss this further in our next meeting.

            Thanks, Emily
            """,
            date: Calendar.current.date(byAdding: .month, value: -8, to: Date())!
        ),
        Mail(
            sender: "Michael Wilson",
            subject: "Important Announcement",
            content: """
            I have an important announcement to make during our team meeting. It pertains to a strategic shift in our approach to the upcoming product launch. We've received valuable feedback from our beta testers, and I believe it's time to make some adjustments to better meet our customers' needs.

            This change is crucial to our success, and I look forward to discussing it with the team. Please be prepared to share your insights during the meeting.

            Regards, Michael
            """,
            date: Calendar.current.date(byAdding: .month, value: -10, to: Date())!
        ),
        Mail(
            sender: "William Anderson",
            subject: "Product Launch Update",
            content: """
            The product launch is on track. I'll provide an update during our call. We've made substantial progress in the development and marketing of our new product.

            I'm excited to share the latest updates with you during our upcoming call. It's crucial that we coordinate our efforts to ensure a successful launch. Please come prepared with any questions or insights you may have.

            Let's make this product launch a resounding success!

            Best regards, William
            """,
            date: Calendar.current.date(byAdding: .month, value: -12, to: Date())!
        )
    ]
    
    var mailViewData: [MailViewData] {
        mails.map {
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .full
            let relativeTime = formatter.localizedString(for: $0.date, relativeTo: Date())
            return MailViewData(
                sender: $0.sender,
                subject: $0.subject,
                content: $0.content,
                relativeTime: relativeTime
            )
        }
    }
}
