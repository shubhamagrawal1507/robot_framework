# Robot Framework Tests with Browser Library

This repository contains automated tests written using [Robot Framework](https://robotframework.org/) and the [Browser library](https://github.com/MarketSquare/robotframework-browser).

## Prerequisites

- Python 3.7+
- Node 22+
- [Robot Framework](https://robotframework.org/)
- [Browser library](https://github.com/MarketSquare/robotframework-browser)

## Installation

```bash
pip install -r requirements.txt
rfbrowser init
```

## Running Tests

To execute all tests:

```bash
robot  --outputdir results ./tests/test_ui_simplified.robot
```

## Project Structure

```
.
├── tests/
│   └── test_ui_simplified.robot
│   └── test_ui.robot
│   └── test_api.robot
├── resources/
│   └── keywords.robot
│   └── variables.robot
└── README.md
```

## References

- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Browser Library Documentation](https://github.com/MarketSquare/robotframework-browser/blob/main/README.md)