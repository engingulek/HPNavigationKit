# HPNavigationKit
Navigation Kit for Harry Potter Character List Modular Application

## Explanation

### Page Enum
The `Page` enum defines the different pages in the application.  
- `home`: Represents the home page.  
- `detail(Int)`: Represents a detail page that takes an index as a parameter.

### Navigation Class
The `Navigation` class manages the navigation within the app.  
The navigation stack (`path`) is responsible for controlling forward and backward movement between pages.  
You can navigate between pages using the following functions:
- `push`: Push a new page onto the stack.
- `pop`: Pop the last page off the stack.
- `popToRoot`: Pop all pages and return to the root page.

### build(page:) Method
The `build(page:)` method creates the appropriate view for the given page type.  
This method demonstrates the core principle of modular architecture:
- Each module is resolved and created independently using `DependencyRegister`.

### How This Structure Works
With this setup:
- Each module remains independent while still allowing navigation between pages.
- Navigation and module interaction are managed through dependency injection and a protocol-based approach.
