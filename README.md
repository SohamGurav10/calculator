# Flutter Calculator App

A simple **Flutter calculator app** inspired by Realme ColorOS calculator design.  
Supports **basic arithmetic operations** with **live expression evaluation**, **error handling**, and **operator validation**.

---

## Features Implemented

### Core Features
- **Basic arithmetic operations:** `+`, `-`, `x`, `/`, `%`.
- **Clear and delete buttons:** Easily reset input or delete the last character.
- **Operator validation:** Prevents consecutive operators and invalid input at the start.
- **Error-safe parsing:** Uses `math_expressions` library to safely evaluate user input without crashing on incomplete expressions.
- **Live expression evaluation:** Displays the evaluated result below the input expression in real time.
- **Equals-to (`=`) functionality:** Evaluates and confirms the final result.

---

### Dependencies
- [**math_expressions**](https://pub.dev/packages/math_expressions)  
  Parses and evaluates mathematical expressions safely.

---

### UI Design
- **Dark theme** with grey and deep orange accents.
- Input expression displayed at the top with a larger font.
- Live evaluation displayed below the input expression.
- Numpad with buttons for numbers, operators, and actions.

---

### How to Run
1. Clone the repository:
```bash
git clone git@github.com:<your-username>/calculator.git
