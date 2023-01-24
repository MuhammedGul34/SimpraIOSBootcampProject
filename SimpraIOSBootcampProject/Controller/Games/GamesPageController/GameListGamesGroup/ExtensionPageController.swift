//
//  ExtensionPageController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 24.01.2023.
//

import UIKit

extension GamesPageController {
    func localNotification() {
            NotificationCenter.default.addObserver(self, selector: #selector(newNoteSaved), name: Notification.Name("NoteNotification"), object: nil)
        }

        @objc func newNoteSaved() {
            let notificationManager: NotificationProtocol = LocalNotificationManager.shared
            notificationManager.sendNotification(title: "Welcome!", message: "Explore the Brand New Games!")
        }

        func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification,
                                    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.sound, .banner, .badge, .list])
        }
}
