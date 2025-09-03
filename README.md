# Sinnoor C - Portfolio Website

A sleek and modern portfolio website built using Flutter Web, showcasing skills, projects, and professional experience through an interactive and visually engaging design.

## Features

✨ **Modern Design**: Clean, professional interface with custom animations and smooth scrolling
🎨 **Interactive Animations**: Dynamic wave pattern background with mouse interaction effects
📱 **Responsive Layout**: Optimized for desktop, tablet, and mobile viewing
🧭 **Smooth Navigation**: Floating navigation menu with scroll progress indicator
📋 **Comprehensive Sections**:
- **Hero Section**: Eye-catching introduction with animated background
- **About Section**: Professional background, experience, and education
- **Skills Section**: Technical competencies organized by category
- **Projects Section**: Showcase of featured work with technology details
- **Contact Section**: Interactive contact form and social links

## Technical Stack

- **Framework**: Flutter Web
- **State Management**: Riverpod with Hooks
- **Routing**: Go Router
- **Architecture**: Clean Architecture with Feature-based organization
- **Styling**: Custom design system with responsive breakpoints

## Getting Started

### Prerequisites
- Flutter SDK (>=3.5.4)
- Dart SDK
- Web browser

### Installation

1. Clone the repository
```bash
git clone https://github.com/sinnoorc/my_portfolio.git
cd my_portfolio
```

2. Install dependencies
```bash
flutter pub get
```

3. Generate assets and build files
```bash
flutter packages pub run build_runner build
```

4. Run the application
```bash
flutter run -d chrome
```

## Project Structure

```
lib/
├── src/
│   ├── app/                 # App configuration and routing
│   ├── features/            # Feature-based modules
│   │   └── home/           # Homepage feature
│   │       ├── presentation/
│   │       │   ├── screens/ # Page screens
│   │       │   └── widgets/ # Reusable components
│   │       ├── data/        # Data layer (future)
│   │       └── providers/   # State providers (future)
│   └── gen/                # Generated files (assets, fonts)
├── common_libs.dart        # Common imports
└── main.dart              # App entry point
```

## Customization

### Personal Information
Update the personal details in:
- `lib/src/features/home/presentation/widgets/bottom_section.dart` - Hero text
- `lib/src/features/home/presentation/widgets/about_section.dart` - About content
- `lib/src/features/home/presentation/widgets/contact_section.dart` - Contact details

### Colors and Styling
The main brand color (`#F40C3F`) can be updated throughout the components. Custom fonts are located in `assets/fonts/`.

### Projects and Skills
Add or modify projects and skills in their respective section files:
- `lib/src/features/home/presentation/widgets/skills_section.dart`
- `lib/src/features/home/presentation/widgets/projects_section.dart`

## Deployment

### Web Deployment
```bash
flutter build web --release
```

The built files will be in the `build/web/` directory, ready for deployment to any static hosting service.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

**Sinnoor C**  
Flutter Developer & Creative Problem Solver

- Email: sinnoor.dev@gmail.com
- GitHub: [github.com/sinnoorc](https://github.com/sinnoorc)
- LinkedIn: [linkedin.com/in/sinnoorc](https://linkedin.com/in/sinnoorc)

---

*Built with ❤️ using Flutter Web*
