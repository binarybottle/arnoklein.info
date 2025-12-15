# Arno Klein Personal Website

Modern, responsive redesign of arnoklein.info

## Overview

This website has been rebuilt with modern web standards, responsive design, and consolidated CSS for easy maintenance.

## Features

- **Responsive Design**: Works seamlessly on phones, tablets, and desktops
- **Mobile-First Approach**: Optimized for small screens with progressive enhancement
- **Consolidated CSS**: All styles in a single `style.css` file for easy maintenance
- **Semantic HTML5**: Clean, accessible markup
- **Modern Typography**: Uses Open Sans font with system font fallbacks
- **Flexible Layout**: CSS Grid and Flexbox for adaptive layouts
- **No Build Process Needed**: Pure HTML/CSS, no JavaScript required

## File Structure

```
/
├── index.html      # Home page
├── cv.html         # Curriculum Vitae
├── mind.html       # Mind-assisting technologies
├── brain.html      # Brain image analysis
├── design.html     # Design & visualization
├── style.css       # Consolidated stylesheet
├── images/         # All website images
│   ├── index/
│   ├── cv/
│   ├── mind/
│   ├── brain/
│   └── design/
└── old/            # Original website backup
```

## Responsive Breakpoints

- **Mobile**: < 640px (single column, stacked navigation)
- **Tablet**: 640px - 1023px (adaptive grid)
- **Desktop**: ≥ 1024px (full layout with sidebars)

## Browser Support

- Modern browsers (Chrome, Firefox, Safari, Edge)
- Mobile browsers (iOS Safari, Chrome Mobile)
- Graceful degradation for older browsers

## Maintenance

### Adding Content

All pages follow a consistent structure:
1. Header with banner image
2. Navigation menu
3. Main content sections
4. No footer needed

### Updating Styles

All styling is in `style.css`. Key sections:
- **Base Styles**: Typography, colors, resets
- **Layout**: Container, grid, flexbox
- **Components**: Navigation, project cards, publications
- **Responsive**: Media queries for different screen sizes

### Adding Images

Place images in the appropriate subfolder under `images/` and reference them with relative paths like `images/section/filename.png`.

## Design Principles

1. **Clean and Minimal**: Focus on content
2. **Consistent Spacing**: Using rem units for scalability
3. **Readable Typography**: Optimized line length and spacing
4. **Accessible Colors**: High contrast for readability
5. **Fast Loading**: No external dependencies except Google Fonts

## Original Website

The original website has been moved to the `old/` directory for reference.

