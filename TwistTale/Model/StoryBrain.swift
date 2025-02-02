import Foundation

struct StoryBrain {
    
    private var storyPosition: Int = 0
    private var stories: [Story]!
    
    init() {
        stories = loadStories()
    }
    
    
    mutating func nextStory(userChoice: String) {
        if userChoice == stories[storyPosition].choice1 {
            storyPosition = stories[storyPosition].choice1Destination!
        } else {
            storyPosition = stories[storyPosition].choice2Destination!
        }
    }
    
    func getStory() -> Story {
        return stories[storyPosition]
    }
    
    func isStoryEnded() -> Bool {
        let currentStory = getStory()
        return currentStory.choice1Destination == nil && currentStory.choice2Destination == nil
    }
    
    mutating func resetStory() {
        storyPosition = 0
    }
    
    private func loadStories() -> [Story] {
        return [
            Story(
                title: "In the middle of a forest, you see an abandoned bridge...",
                choice1: "Walk towards the bridge...",
                choice1Destination: 1,
                choice2: "Ignore the bridge and head into the depths of the forest...",
                choice2Destination: 4),

            Story(
                title: "As you step onto the bridge, the stones beneath your feet creak. Suddenly, you stop in the middle of the bridge. A deep river flows below...",
                choice1: "Try to cross the river...",
                choice1Destination: 2,
                choice2: "Turn back and head into the forest...",
                choice2Destination: 3),

            Story(
                title: "As you try to cross the river, you lose your footing and get swept away. Everything goes dark. Your story ends here.",
                choice1: nil,
                choice1Destination: nil,
                choice2: nil,
                choice2Destination: nil),

            Story(
                title: "As you turn back to the forest, you hear an unknown voice. You step forward and investigate the source of the sound. A hand grabs you...",
                choice1: nil,
                choice1Destination: nil,
                choice2: nil,
                choice2Destination: nil),

            Story(
                title: "You decide to head deeper into the forest. As you walk slowly, a beam of light falls from the sky towards you...",
                choice1: "Walk towards the light...",
                choice1Destination: 5,
                choice2: "Run away from the light and turn back...",
                choice2Destination: 6),

            Story(
                title: "As you walk towards the light, the world starts spinning and a new universe appears before your eyes...",
                choice1: nil,
                choice1Destination: nil,
                choice2: nil,
                choice2Destination: nil),

            Story(
                title: "As you run away from the light and turn back, the forest closes in on you. There's no turning back. Your story ends here.",
                choice1: nil,
                choice1Destination: nil,
                choice2: nil,
                choice2Destination: nil),
        ]
    }
    
}

