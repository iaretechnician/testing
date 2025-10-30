# GitHub Copilot Instructions Template

## Overview
This file provides instructions to GitHub Copilot about how to work with code in this repository. Copilot reads this file to understand your project's conventions, patterns, and preferences.

## How to Use This File

1. **Customize for Your Project**: Replace the template sections below with specific instructions for your codebase
2. **Be Specific**: The more detailed your instructions, the better Copilot can assist you
3. **Keep Updated**: Update this file as your project evolves and new patterns emerge
4. **Share with Team**: Commit this file so all team members benefit from consistent Copilot suggestions

## Template Sections

### Project Information
```
- Project Name: [Your Project Name]
- Primary Languages: [e.g., JavaScript, Python, C#]
- Framework/Technology Stack: [e.g., React, .NET, Django]
- Purpose: [Brief description of what this project does]
```

### Coding Standards

#### Naming Conventions
```
- Variables: [e.g., camelCase, snake_case]
- Functions: [e.g., camelCase, PascalCase]
- Classes: [e.g., PascalCase]
- Constants: [e.g., UPPER_SNAKE_CASE]
- Files: [e.g., kebab-case, PascalCase]
```

#### Code Style
```
- Indentation: [e.g., 2 spaces, 4 spaces, tabs]
- Line Length: [e.g., 80, 120 characters]
- Quotes: [e.g., single quotes, double quotes]
- Semicolons: [e.g., required, optional]
- Braces: [e.g., same line, new line]
```

### Architecture & Patterns
```
- Design Patterns: [e.g., MVC, MVVM, Repository Pattern]
- Folder Structure: [Describe your folder organization]
- Error Handling: [Describe your approach to error handling]
- Logging: [Describe logging patterns and libraries used]
```

### Testing Guidelines
```
- Testing Framework: [e.g., Jest, NUnit, pytest]
- Test File Naming: [e.g., *.test.js, *Tests.cs]
- Test Coverage Goals: [e.g., 80% coverage minimum]
- Mocking Strategy: [Describe mocking approach]
```

### Documentation Standards
```
- Comment Style: [e.g., JSDoc, XML comments, docstrings]
- README Requirements: [What should be documented]
- Inline Comments: [When to use, when to avoid]
```

### Dependencies & Libraries
```
- Package Manager: [e.g., npm, pip, NuGet]
- Key Dependencies: [List important libraries]
- Version Requirements: [Any specific version constraints]
```

### Git & Version Control
```
- Branch Naming: [e.g., feature/, bugfix/, hotfix/]
- Commit Message Format: [e.g., Conventional Commits]
- PR Requirements: [What's needed before merging]
```

### Security & Best Practices
```
- Authentication: [How auth is handled]
- Secret Management: [How to handle sensitive data]
- Input Validation: [Validation approach]
- Security Libraries: [Any security tools used]
```

### Performance Considerations
```
- Optimization Priorities: [e.g., database queries, API calls]
- Caching Strategy: [How caching is implemented]
- Resource Management: [Memory, connections, etc.]
```

## Example Instruction Set

Here's an example of how to customize this file:

```markdown
# GitHub Copilot Instructions for My Web App

## Project Information
- Project Name: My Awesome Web App
- Primary Languages: TypeScript, JavaScript
- Framework: React 18 with Next.js 14
- Purpose: E-commerce platform for digital products

## Coding Standards

### Naming Conventions
- Use camelCase for variables and functions
- Use PascalCase for React components and classes
- Use UPPER_SNAKE_CASE for environment variables and constants
- Use kebab-case for file names

### Code Style
- Use 2 spaces for indentation
- Maximum line length: 100 characters
- Use single quotes for strings
- Always use semicolons
- Opening braces on same line

## Specific Instructions
- Always use TypeScript strict mode
- Prefer functional components with hooks over class components
- Use React Query for data fetching
- Error boundaries should wrap all route components
- Use Tailwind CSS for styling, avoid inline styles
- API routes should include proper error handling and validation
- All forms should use React Hook Form with Zod validation
```

## Tips for Effective Instructions

1. **Start Simple**: Begin with the most important conventions and add details over time
2. **Use Examples**: Show code examples of preferred patterns
3. **Explain Why**: When possible, explain reasoning behind conventions
4. **Be Consistent**: Ensure instructions align with your existing codebase
5. **Regular Reviews**: Review and update quarterly or after major changes

## Additional Resources

- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [Best Practices for AI Pair Programming](https://github.blog/2023-06-20-how-to-write-better-prompts-for-github-copilot/)
- [Conventional Commits](https://www.conventionalcommits.org/)

---

**Note**: This is a template. Delete this section and customize the file for your specific project needs.
