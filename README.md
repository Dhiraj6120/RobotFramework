# Web Automation Framework Using Robot Framework

## Overview
This project is a basic automation framework built using the Robot Framework, designed for testing web applications. It uses the Page Object Model (POM) structure and integrates various libraries like SeleniumLibrary, Collections, String, and Pabot. The framework is created to automate tests for the DemowebShop website.

## Features
- **Robot Framework**: Main testing framework.
- **Pabot**: For parallel test execution, improving the speed and efficiency of test runs.
- **Page Object Model (POM)**: Structured approach for organizing test elements.
- **SeleniumLibrary**: For browser automation.
- **Custom Keywords**: Defined in a custom library to extend Robot Framework's capabilities.
- **Test Data Management**: Dedicated folder for storing test data files.
- **Utility Functions**: Common functions stored in a utility folder to support various operations.

## Folder Structure
The project follows an organized folder structure to maintain the reusability and readability of the code.

- **Pages**: Holds locators and elements for various web application pages.
- **TestCases**: Contains test cases for different functionalities.
- **CustomLibrary**: Stores custom keywords created for the Robot Framework.
- **BrowserDrivers**: Stores web browser drivers (e.g., Chrome, Firefox).
- **TestData**: Stores test data files used in test execution.
- **Util**: Contains utility files or common functions used across the framework.

## Libraries Used
- **SeleniumLibrary**: For interacting with web browsers.
- **Collections**: To work with lists, dictionaries, and sets.
- **String**: For string manipulation and comparison.
- **Pabot**: For parallel test execution of Robot Framework test cases.

## Getting Started

### Prerequisites
- **Python** (>=3.7)
- **Robot Framework** (>=4.0)
- **Pabot**: For running tests in parallel.
- **SeleniumLibrary** for browser automation.
- **Web Browser Drivers** (Chrome, Firefox).

### Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/Dhiraj6120/RobotFramework.git
    cd your-repo-directory
    ```

2. Install the required dependencies:
    ```bash
   pip install robotframework

    pip install robotframework-datadriver
    ```

3. Ensure that browser drivers are placed in the `BrowserDrivers` folder or properly set up in your system's path.

### Running Test Cases
To run test cases, use the following command:

1. **Run a Test Case File**
   ```bash
   robot testcase_name.robot
   ```
   
2. **Run Specific Test Case by Name**
   ```bash
   robot --test "<Test Case Name>" testcase_filename.robot
   ```
   Example:
   ```bash
   robot --test "Login Test" testcase.robot
   ```

3. **Run All Tests in a Directory**
   ```bash
   robot directory_path .
   ```

4. **Run Test Cases with a Specific Tag**
   ```bash
   robot --include <TAGNAME> testcase.robot
   ```
   Example:
   ```bash
   robot --include SMOKE testcase.robot
   ```

5. **Run Test Cases with Excluded Tags**
   ```bash
   robot --exclude <TAGNAME> testcase.robot
   ```
   Example:
   ```bash
   robot --exclude REGRESSION testcase.robot
   ```

6. **Run Test Cases with a Specific Variable**
   ```bash
   robot --variable <VariableName>:<Value> testcase.robot
   ```
   Example:
   ```bash
   robot --variable BROWSER:chrome testcase.robot
   ```

7. **Run Test Cases with Multiple Variables**
   ```bash
   robot --variable <Variable1Name>:<Value1> --variable <Variable2Name>:<Value2> testcase.robot
   ```
   Example:
   ```bash
   robot --variable BROWSER:chrome --variable ENVIRONMENT:staging testcase.robot
   ```

8. **Run Tests in Parallel (Using Pabot)**
   ```bash
   pabot testcase_name.robot
   ```


