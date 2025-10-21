# 📱 C-Cell LNMIIT — Official Student App

<p align="center">
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.8.1+-02569B?style=for-the-badge&logo=flutter&logoColor=white" /></a>
  <a href="https://firebase.google.com"><img src="https://img.shields.io/badge/Firebase-Backend-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" /></a>
  <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-Language-0175C2?style=for-the-badge&logo=dart&logoColor=white" /></a>
  <a href="#"><img src="https://img.shields.io/badge/Platform-Android%20|%20iOS%20|%20Web-34A853?style=for-the-badge&logo=google" /></a>
  <a href="#"><img src="https://img.shields.io/badge/License-Private-red?style=for-the-badge" /></a>
</p>

## 📖 About

The official mobile and web application for the **Counselling and Guidance Cell (C-Cell)** at **The LNM Institute of Information Technology (LNMIIT)**, Jaipur.

This comprehensive platform serves as the central hub for student life, providing access to academic resources, campus information, student organizations, and real-time notifications.

## ✨ Key Features

### 🏠 Home Dashboard
- Personalized welcome screen with user profile
- Quick access to 6+ essential campus services
- Real-time statistics (25+ active clubs, 7 departments)
- Academic calendar, bus timetable, mess menu
- Campus navigation and location finder

### 🎯 Student Gymkhana
- Complete information about Student Gymkhana leadership
- Presidential Council with contact details
- **Cultural Council** – 11 clubs: Aaveg, Capriccio, Eminence, Fundoo, Imagination, Insignia, LC, Media Cell, Rendition, Sankalp, Vignette
- **Science & Technology Council** – 7 clubs: Astronomy, Cipher Club, Cybros, DebSoc, E-Cell, Phoenix, Quizzinga
- **Sports Council** – 11 sports: Badminton, Basketball, Chess, Cricket, Football, Kabaddi, Lawn Tennis, Squash, Table Tennis, Volleyball
- COSHA Committee information
- **Major fest details**: Desportivos (Sports), Plinth (Tech-Management), Vivacity (Cultural)
- **Student events**: TEDxLNMIIT, E-Summit

### 🔔 Push Notifications
- Real-time Firebase Cloud Messaging (FCM) integration
- Cross-platform support (Android, iOS, Web)
- Topic-based subscriptions (all-users, department-specific)
- Background notification handling
- Custom Notification API integration
- Guest user support with account merging

### 🏛️ LNMIIT Information
- Faculty contacts and HOD information
- Hostel contacts and administration
- Campus map with interactive navigation
- Academic area map (PDF viewer)
- Department-wise curriculum (CSE, CCE, ECE, MME, M.Tech)
- Important institutional links
- Director's message

### 👤 User Profile
- Google Sign-In authentication (LNMIIT email only)
- Auto-extracted student details (Roll number, Branch, Batch, Degree)
- Custom profile picture upload
- Light/Dark theme toggle
- Secure sign-out functionality

### 🌓 Theme Support
- Dynamic light and dark mode
- Material Design 3 theming
- Smooth theme transitions
- Persistent theme preferences

### ℹ️ About C-Cell
- Team information (Coordinators, Associate Coordinators, Mentors)
- Convener message
- App developer credits
- Contact information

## 🛠️ Tech Stack

### Frontend
- **Flutter 3.8.1+** — Cross-platform UI framework
- **Dart** — Programming language
- **Material Design 3** — UI/UX design system

### Backend & Services
- **Firebase Authentication** — Google Sign-In
- **Firebase Cloud Messaging** — Push notifications
- **Firebase Hosting** — Web deployment
- **Custom Notification API**: `ccell-notification-api.onrender.com`

### Key Packages
```yaml
firebase_core: ^3.15.2
firebase_auth: ^5.6.0
firebase_messaging: ^15.2.10
google_sign_in: ^6.3.0
flutter_local_notifications: ^19.4.0
http: ^1.4.0
provider: ^6.0.5
shared_preferences: ^2.5.3
google_fonts: ^6.2.1
flutter_screenutil: ^5.9.3
salomon_bottom_bar: ^3.3.2
syncfusion_flutter_pdfviewer: ^30.1.41
```

## 📂 Project Structure

```
lib/
├── core/
│   ├── config/          # Firebase configuration
│   ├── theme/           # Theme provider and app themes
│   └── utils/           # Utility functions (guest ID manager)
├── data/
│   ├── repositories/    # Notification repository
│   └── services/        # Notification service
├── features/
│   └── notifications/   # Notification models and state
├── presentation/
│   ├── screens/
│   │   ├── about/       # About C-Cell pages
│   │   ├── auth/        # Login and authentication
│   │   ├── common/      # Shared screens (More, Coming Soon)
│   │   ├── gymkhana/    # Gymkhana, clubs, sports
│   │   ├── home/        # Home dashboard
│   │   ├── lnmiit/      # LNMIIT information pages
│   │   ├── notifications/ # Notification screen
│   │   ├── onboarding/  # Onboarding flow
│   │   ├── profile/     # User profile
│   │   └── resources/   # PDF viewer, COSHA
│   └── widgets/         # Reusable UI components
└── main.dart            # App entry point
```

## 🚀 Getting Started

## 🔐 Authentication

The app uses **Firebase Authentication** with **Google Sign-In**, restricted to LNMIIT email addresses (`@lnmiit.ac.in`).

Guest users can browse limited content, with the ability to merge their account upon sign-in.

## 📬 Notification System

### Architecture
- **Mobile**: Native FCM with local notifications
- **Web**: FCM with VAPID key support
- **Backend**: Custom SpringBoot API for token management and topic subscriptions

### Features
- Topic-based subscriptions (all-users, department-specific)
- Foreground and background notification handling
- Guest user support with account merging
- Authorized sender verification for posting notifications

## 🎨 Design Philosophy
- Material Design 3 principles
- Responsive layouts for mobile, tablet, and desktop
- Smooth animations and transitions
- Accessibility-first approach
- Dark mode support throughout

## 👥 Team

### Coordinators
- Aditya Kansal
- Kunal Sharma
- Neha Raniwala

### App Developers
- Mudit Choudhary
- Yash Raj
- Praneel Dev
- Panth Moradia
- Nikhila S Hari
- Ishita Agarwal
- Armaan Jain

## 📄 License

This project is **private and proprietary** to C-Cell, LNMIIT.  
Unauthorized distribution or reproduction is prohibited.

## 📞 Contact

**C-Cell, LNMIIT**  
📧 Email: c-cell.students@lnmiit.ac.in  
📸 Instagram: [@C-CELL LNMIIT](https://instagram.com/ccell.lnmiit?igsh=M3V4dmlvZWFyYXky)


---

<p align="center">Made with ❤️ by C-Cell LNMIIT</p>
