# Poocalendar

A calendar application in Ruby using Object-Oriented Programming (OOP).

## Description

This project is an OOP exercise that allows you to:
- Create and manage users
- Create and manage events with dates, durations, titles, and attendees
- Manipulate and display events

## Structure

```
Poocalendar/
├── lib/
│   ├── user.rb                # User class
│   ├── event.rb               # Event class
│   ├── event_creator.rb       # Interactive event creator (BONUS)
│   ├── calendar_displayer.rb  # ASCII calendar display (BONUS)
│   └── date_parser.rb         # Natural language date parser (BONUS)
├── app.rb                     # Main entry point
├── app_bonus.rb               # Bonus features demo
├── test_event_creator.rb      # Interactive event creator test
├── README.md
└── Gemfile
```

## Installation

```bash
bundle install
```

## Usage

### Run base tests
```bash
ruby app.rb
```

### Run bonus features demo
```bash
ruby app_bonus.rb
```

### Interactive event creation
```bash
ruby test_event_creator.rb
```

## Classes

### User
Manages users with:
- Email
- Age
- Search and listing methods

### Event
Manages events with:
- Start date (Time)
- Duration (in minutes)
- Title
- List of attendees
- Manipulation and information methods

### BONUS Features

#### EventCreator
Interactive CLI menu for creating events with step-by-step guidance.

#### CalendarDisplayer
ASCII calendar display showing events organized by month.

#### DateParser
Natural language date parser supporting formats like:
- "tomorrow at 10am"
- "next Monday at 9am"
- "March 14 at 3pm"

## Author

Ruby OOP Exercise - The Hacking Project
