import Foundation

struct Challenge {
    let id: String
    let title: String
    let description: String
    let duration: Int
    let price: Double
    let category: String
    let couchId: String
    let couchName: String
    let parcipantsCount: Int
    let imageName: String?
    
    static func testChallenges() -> [Challenge] {
        [Challenge(
            id: "1",
            title: "30 дней приседаний",
            description: "Ежедневные приседания для укрепления ног",
            duration: 30,
            price: 0,
            category: "Фитнес",
            couchId: "couch1",
            couchName: "Анна Иванова",
            parcipantsCount: 150,
            imageName: "squat"
        ),
         Challenge(
            id: "2",
            title: "Утренняя зарядка 21 день",
            description: "Формируем привычку утренней зарядки",
            duration: 21,
            price: 499,
            category: "Здоровье",
            couchId: "coach2",
            couchName: "Максим Петров",
            parcipantsCount: 89,
            imageName: "morning"
         ),
         Challenge(
            id: "3",
            title: "Йога для начинающих",
            description: "Базовые асаны дыхательные практики",
            duration: 30,
            price: 999,
            category: "Йога",
            couchId: "coach3",
            couchName: "Ольга Сидорова",
            parcipantsCount: 45,
            imageName: "yoga"
         )
        ]
    }
}
